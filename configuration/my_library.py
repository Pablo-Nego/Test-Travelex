from datetime import timedelta
from typing import Optional

from selenium.common.exceptions import TimeoutException, WebDriverException
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait

from SeleniumLibrary.base import keyword, LibraryComponent
from SeleniumLibrary.utils import secs_to_timestr
from selenium import webdriver

class AlertKeywords(LibraryComponent):
    ACCEPT = "ACCEPT"
    DISMISS = "DISMISS"
    LEAVE = "LEAVE"
    _next_alert_action = ACCEPT

    @keyword
    def input_text_into_alert(
        self, text: str, action: str = ACCEPT, timeout: Optional[timedelta] = None
    ):
        """Types the given ``text`` into an input field in an alert.

        The alert is accepted by default, but that behavior can be controlled
        by using the ``action`` argument same way as with `Handle Alert`.

        ``timeout`` specifies how long to wait for the alert to appear.
        If it is not given, the global default `timeout` is used instead.

        New in SeleniumLibrary 3.0.
        """
        alert = self._wait_alert(timeout)
        alert.send_keys(text)
        self._handle_alert(alert, action)

    @keyword
    def alert_should_be_present(
        self,
        text: str = "",
        action: str = ACCEPT,
        timeout: Optional[timedelta] = None,
    ):
        """Verifies that an alert is present and by default, accepts it.

        Fails if no alert is present. If ``text`` is a non-empty string,
        then it is used to verify alert's message. The alert is accepted
        by default, but that behavior can be controlled by using the
        ``action`` argument same way as with `Handle Alert`.

        ``timeout`` specifies how long to wait for the alert to appear.
        If it is not given, the global default `timeout` is used instead.

        ``action`` and ``timeout`` arguments are new in SeleniumLibrary 3.0.
        In earlier versions, the alert was always accepted and a timeout was
        hardcoded to one second.
        """
        message = self.handle_alert(action, timeout)
        if text and text != message:
            raise AssertionError(
                f"Alert message should have been '{text}' but it " f"was '{message}'."
            )

    @keyword
    def alert_should_not_be_present(
        self, action: str = ACCEPT, timeout: Optional[timedelta] = None
    ):
        """Verifies that no alert is present.

        If the alert actually exists, the ``action`` argument determines
        how it should be handled. By default, the alert is accepted, but
        it can be also dismissed or left open the same way as with the
        `Handle Alert` keyword.

        ``timeout`` specifies how long to wait for the alert to appear.
        By default, is not waited for the alert at all, but a custom time can
        be given if alert may be delayed. See the `time format` section
        for information about the syntax.

        New in SeleniumLibrary 3.0.
        """
        try:
            alert = self._wait_alert(timeout)
        except AssertionError:
            return
        text = self._handle_alert(alert, action)
        raise AssertionError(f"Alert with message '{text}' present.")

    @keyword
    def handle_alert(self, action: str = ACCEPT, timeout: Optional[timedelta] = None):
        """Handles the current alert and returns its message.

        By default, the alert is accepted, but this can be controlled
        with the ``action`` argument that supports the following
        case-insensitive values:

        - ``ACCEPT``: Accept the alert i.e. press ``Ok``. Default.
        - ``DISMISS``: Dismiss the alert i.e. press ``Cancel``.
        - ``LEAVE``: Leave the alert open.

        The ``timeout`` argument specifies how long to wait for the alert
        to appear. If it is not given, the global default `timeout` is used
        instead.

        Examples:
        | Handle Alert |                |       | # Accept alert.  |
        | Handle Alert | action=DISMISS |       | # Dismiss alert. |
        | Handle Alert | timeout=10 s   |       | # Use custom timeout and accept alert.  |
        | Handle Alert | DISMISS        | 1 min | # Use custom timeout and dismiss alert. |
        | ${message} = | Handle Alert   |       | # Accept alert and get its message.     |
        | ${message} = | Handle Alert   | LEAVE | # Leave alert open and get its message. |

        New in SeleniumLibrary 3.0.
        """
        self.info(f"HANDLE::{type(timeout)}::{timeout}")
        alert = self._wait_alert(timeout)
        return self._handle_alert(alert, action)

    def _handle_alert(self, alert, action):
        action = action.upper()
        text = " ".join(alert.text.splitlines())
        if action == self.ACCEPT:
            alert.accept()
        elif action == self.DISMISS:
            alert.dismiss()
        elif action != self.LEAVE:
            raise ValueError(f"Invalid alert action '{action}'.")
        return text

    def _wait_alert(self, timeout=None):
        timeout = self.get_timeout(timeout)
        wait = WebDriverWait(self.driver, timeout)
        try:
            return wait.until(EC.alert_is_present())
        except TimeoutException:
            raise AssertionError(f"Alert not found in {secs_to_timestr(timeout)}.")
        except WebDriverException as err:
            raise AssertionError(f"An exception occurred waiting for alert: {err}")
        

class PopupHandler:
    def __init__(self):
        # Configurar o navegador Chrome (você pode usar outro navegador, se preferir)
        options = webdriver.ChromeOptions()
        options.add_argument('--disable-extensions')  # Desabilitar extensões para evitar pop-ups
        self.driver = webdriver.Chrome(chrome_options=options)

    def open_website_and_handle_popups(self, url):
        # Abrir uma página da web
        self.driver.get(url)

        # Lidar com pop-ups automaticamente
        for window_handle in self.driver.window_handles:
            self.driver.switch_to.window(window_handle)
            self.driver.close()

    def close_browser(self):
        # Fechar o navegador
        self.driver.quit()
       