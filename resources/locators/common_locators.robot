*** Variables ***
# Header Navigation
${LOC_ACCOUNT_BUTTON}           id=btn-account
${LOC_SIGNIN_LINK}              xpath=//*[@id="nav-account-menu"]/a
${LOC_CART_BUTTON}              id=btn-cart
${LOC_LANGUAGE_BUTTON}           id=btn-lang
${LOC_LANGUAGE_LINK}              xpath=//*[@id="nav-lang-menu"]

# Shadow Root
${LOC_SHADOW_HOST}              css=div[data-testid="shadow-host"]

# Notifications
${LOC_NOTIFICATION_ROOT}        css=div[data-testid="notifications-root"]
${LOC_NOTIFICATION_STATUS}      xpath=//div[@role='status']

# Wait for order-confirm detail
${LOC_ORDER_CONFIRM}            css=li[aria-label="checkout-li-0"]