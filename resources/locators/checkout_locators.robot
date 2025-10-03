*** Variables ***
# Checkout Price Elements (Shadow DOM)
${SHADOW_SELECTOR_SUBTOTAL}         css=span[data-testid="checkout-subtotal"][aria-label="checkout-span-1"]
${SHADOW_SELECTOR_DISCOUNT}         span[data-testid="checkout-discount"]
${SHADOW_SELECTOR_SHIPPING}         span[data-testid="checkout-shipping"]
${SHADOW_SELECTOR_VAT}              span[data-testid="checkout-vat"]
${SHADOW_SELECTOR_TOTAL}            span[data-testid="checkout-total"]