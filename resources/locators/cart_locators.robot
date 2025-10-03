*** Variables ***
# Shadow DOM Selectors for Cart
${SHADOW_SELECTOR_CHECKBOX_0}       input[type="checkbox"][aria-label="cart-input-0"]
${SHADOW_SELECTOR_PROCEED_BTN}      button[data-testid="cart-proceed"]

# Checkout Price Elements (Shadow DOM)
${SHADOW_SELECTOR_SUBTOTAL}         span[data-testid="checkout-subtotal"]
${SHADOW_SELECTOR_DISCOUNT}         span[data-testid="checkout-discount"]
${SHADOW_SELECTOR_SHIPPING}         span[data-testid="checkout-shipping"]
${SHADOW_SELECTOR_VAT}              span[data-testid="checkout-vat"]
${SHADOW_SELECTOR_TOTAL}            span[data-testid="checkout-total"]