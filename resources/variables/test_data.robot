*** Variables ***
# Application URLs
${BASE_URL}                     https://training-platform2.doppio-tech.com

# Browser Configuration
${BROWSER}                      chrome
${SELENIUM_SPEED}               0.1
${IMPLICIT_WAIT}                0.5s
${DEFAULT_TIMEOUT}              5s
${LONG_TIMEOUT}                 10s

# Test Credentials
${VALID_EMAIL}                  jiradech@hometest.com
${VALID_PASSWORD}               3a3a3oSs

# Test Data - Test Case 01
${SEARCH_KEYWORD}               mug
${PRODUCT_NAME}                 Ceramic Mug
${PRODUCT_COLOR}                White
${PRODUCT_QUANTITY}             3

# Test Data - Test Case 02
${SEARCH_KEYWORD_TC02}          Ceramic Mug
${PRODUCT_COLOR_TC02}           Gray
${PRODUCT_QUANTITY_TC02}        3
${PRODUCT_ID_CERAMIC_MUG}       11

# Coupon Code
${COUPON_CODE}                  General12345