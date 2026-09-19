-- This is an empty migration.
ALTER TABLE users
ADD CONSTRAINT user_address_country_check
CHECK (
    user_address_country IN (
        'India',
        'Bahrain',
        'Saudi Arabia',
        'United Arab Emirates',
        'United States',
        'Kuwait',
        'Qatar',
        'Oman'
    )
);

ALTER TABLE outlets
ADD CONSTRAINT outlet_address_country_check
CHECK (
    outlet_address_country IN (
        'India',
        'Bahrain',
        'Saudi Arabia',
        'United Arab Emirates',
        'United States',
        'Kuwait',
        'Qatar',
        'Oman'
    )
);

ALTER TABLE chains
ADD CONSTRAINT chain_headquarters_address_country_check
CHECK (
    chain_headquarters_address_country IN (
        'India',
        'Bahrain',
        'Saudi Arabia',
        'United Arab Emirates',
        'United States',
        'Kuwait',
        'Qatar',
        'Oman'
    )
);