# Doppee Shop E2E Automation Testing

Robot Framework test automation project for Doppee Shop e-commerce platform using Page Object Model (POM) pattern.

## 📋 Project Structure

```
doppee-shop-automation/
├── resources/
│   ├── locators/          # All element locators organized by page
│   ├── pages/             # Page Object keywords
│   └── variables/         # Test data and configuration
├── tests/                 # Test case files
└── results/              # Test execution results
```

## 🚀 Prerequisites

- Python 3.8+
- Robot Framework
- SeleniumLibrary
- Chrome Browser
- VScode extension suggest: RobotCode

## 📦 Installation

```bash
# Create virtual environment (recommended)
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt
```

## 🔧 Configuration

All test data is centralized in `resources/variables/test_data.robot`:

- URLs
- Credentials
- Test data (product names, quantities, etc.)
- Timeouts

## ▶️ Running Tests

### Run all tests

```bash
robot tests/
```

### Run 3 times

```bash
# Windows
for /L %i in (1,1,3) do robot tests/test_case_01.robot
```

### Run specific test case

```bash
robot tests/test_case_01.robot
```

### Run with tags

```bash
robot --include e2e tests/
```

### Parallel execution with Pabot

```bash
# Install pabot
pip install robotframework-pabot

# Run tests in parallel
pabot --processes 2 tests/
```

### Generate report with custom name

```bash
robot --outputdir results --output output.xml --log log.html --report report.html tests/
```

## 📊 Test Cases

### TC-001: Purchase Flow with Autocomplete Search

- Login to application
- Search product using autocomplete suggestions
- Configure product (color, quantity)
- Add to cart and proceed to checkout
- Verify price calculation

### TC-002: Purchase Flow with Direct Search

- Login to application
- Search product by pressing Enter
- Configure product (color, quantity)
- Add to cart and proceed to checkout
- Verify price calculation

## 🏗️ Design Principles

### Page Object Model (POM)

- **Locators**: Separated by page/feature for easy maintenance
- **Pages**: Reusable keywords following Single Responsibility Principle
- **Tests**: High-level, readable test cases using business language

### Naming Conventions

- **Keywords**: First Letter Uppercase And Rest Lowercase
- **Variables**: `${UPPER_CASE}` for constants
- **Files**: snake_case.robot

### Best Practices Applied

1. **Separation of Concerns**: Locators, keywords, and tests are separated
2. **DRY Principle**: Reusable keywords avoid duplication
3. **Readable Tests**: Tests read like specifications
4. **Maintainability**: Changes in UI only require locator updates
5. **Stable Locators**: Prioritize data-testid attributes

## 🔍 Shadow DOM Handling

The application uses Shadow DOM components. We handle this with:

- `Get shadow root element` keyword in common_page.robot
- Shadow selectors stored separately in locator files
- JavaScript execution for accessing shadow elements

## ✅ Assertions

Price calculation verification follows the formula:

```
Subtotal - Discount + Shipping = Total
```

The assertion includes detailed error messages showing actual values.

(PS. Discount price is a none value element then I try to ignore that for calculated correct price for now but next phase I will develop a best test script for sure thank you 😁)

## 📝 Reporting

After test execution, check the `results/` directory for:

- `report.html` - High-level test report
- `log.html` - Detailed execution log with screenshots
- `output.xml` - Machine-readable results

## 📚 References

- [Robot Framework Documentation](https://robotframework.org/)
- [SeleniumLibrary Docs](https://robotframework.org/SeleniumLibrary/)
- [How to Write Good Test Cases](https://github.com/robotframework/HowToWriteGoodTestCases/)

## 👥 Author

Jiradech Khong-ngoen - QA Automation Engineer

## 📄 License

This project is for show case of automated testing purposes only.
