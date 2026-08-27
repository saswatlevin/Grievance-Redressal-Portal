from request_functions import *
outlet_test_data_list = [

    {
        "url": "http://localhost:3000/outlets/create_outlet",

        "test_name": "Test to check response to empty object in CREATE_OUTLET",

        "test_data": {},

        "serial": 1
    },

    {
        "url": "http://localhost:3000/outlets/create_outlet",
        
        "test_name": "Test to create an outlet with all non-null attributes in CREATE_OUTLET",

        "test_data": {
            
            "outlet_name": "Tim Hortons Test Outlet 2",
            "outlet_address_room_no": "5",
            "outlet_address_building": "Test Building 2",
            "outlet_address_street": "Test Street 2",
            "outlet_address_city": "Test City Two",
            "outlet_address_admin_division": "Test Division Two",
            "outlet_address_country": "Saudi Arabia",
            "outlet_address_post_code": "123457",
            "chain_id": 1
        },

        "serial": 2
    },

    {
        "url": "http://localhost:3000/outlets/create_outlet",
        
        "test_name": "Test to create an outlet with an empty outlet_name in CREATE_OUTLET",

        "test_data": {
            "outlet_name": "",
            "outlet_address_street": "Test Street 2",
            "outlet_address_room_no": "4",
            "outlet_address_building": "Test Building 2",
            "outlet_address_street": "Test Street 2",
            "outlet_address_city": "Test City Two",
            "outlet_address_admin_division": "Test Division Three",
            "outlet_address_country": "Saudi Arabia",
            "outlet_address_post_code": "123456",
            "chain_id": None
        },

        "serial": 3

    },

    {
        "url": "http://localhost:3000/outlets/create_outlet",
        
        "test_name": "Test to create an outlet with an empty outlet_address_city in CREATE_OUTLET",

        "test_data": {
            "outlet_name": "Tim Hortons Test Outlet 3",
            "outlet_address_room_no": "4",
            "outlet_address_building": "Test Building 2",
            "outlet_address_street": "Test Street 2",
            "outlet_address_city": "",
            "outlet_address_admin_division": "Test Division Three",
            "outlet_address_country": "Saudi Arabia",
            "outlet_address_post_code": "123458",
            "chain_id": 1
        },

        "serial": 4

    },

    {
        "url": "http://localhost:3000/outlets/create_outlet",
        
        "test_name": "Test to create an outlet with an empty outlet_address_post_code in CREATE_OUTLET",

        "test_data": {
            "outlet_name": "Tim Hortons Test Outlet 4",
            "outlet_address_room_no": "16",
            "outlet_address_building": "Test Building 3",
            "outlet_address_street": "Test Street 3",
            "outlet_address_city": "Test City Three",
            "outlet_address_admin_division": "Test Division Three",
            "outlet_address_country": "India",
            "outlet_address_post_code": "",
            "chain_id": 1
        },

        "serial": 5

    },

    {
        "url": "http://localhost:3000/outlets/create_outlet",
        
        "test_name": "Test to create an outlet for a chain that does not exist in CREATE_OUTLET",

        "test_data": {
            "outlet_name": "Lotteria Test Outlet 4",
            "outlet_address_room_no": "1",
            "outlet_address_building": "Test Building",
            "outlet_address_street": "Test Street",
            "outlet_address_city": "Test City",
            "outlet_address_admin_division": "Test Division",
            "outlet_address_country": "South Korea",
            "outlet_address_post_code": "123100",
            "chain_id": 6
        },

        "serial": 6

    },

    {
        "url": "http://localhost:3000/outlets/update_outlet_name/7",

        "test_name": "Test to check response to empty object in UPDATE_OUTLET_NAME",

        "test_data": {},

        "serial": 7
    },

    {
        "url": "http://localhost:3000/outlets/update_outlet_name/7",

        "test_name": "Test to update outlet_name to UPDATED TIM HORTON'S TEST OUTLET NAME in UPDATE_OUTLET_NAME",

        "test_data": {
            "outlet_name": "UPDATED TIM HORTON'S TEST OUTLET NAME"
        },

        "serial": 8
    },

    {
        "url": "http://localhost:3000/outlets/update_outlet_name/7",

        "test_name": "Test to update outlet_name to UPDATED TIM HORTON'S TEST OUTLET NAME1 in UPDATE_CHAIN_NAME",

        "test_data": {
            "outlet_name": "UPDATED TIM HORTON'S TEST OUTLET NAME1"
        },

        "serial": 9
    },

    {
        "url": "http://localhost:3000/outlets/update_outlet_name/7",

        "test_name": "Test to update outlet_name to 1234 in UPDATE_OUTLET_NAME",

        "test_data": {
            "outlet_name": "1234"
        },

        "serial": 10

    },

    {
        "url": "http://localhost:3000/outlets/update_outlet_address/7",

        "test_name": "Test to update the outlet address room_number to 11 in UPDATE_OUTLET_ADDRESS",

        "test_data": {
            "outlet_address_room_no": "11"
        },

        "serial": 11
    },

    {
        "url": "http://localhost:3000/outlets/update_outlet_address/7",

        "test_name": "Test to update the outlet address room_number to AA in UPDATE_CHAIN_ADDRESS",

        "test_data": {
            "outlet_address_room_no": "AA"
        },

        "serial": 12
    },

    {
        "url": "http://localhost:3000/outlets/update_outlet_address/7",

        "test_name": "Test to update the outlet address building to TEST BUILDING in UPDATE_OUTLET_ADDRESS",

        "test_data": {
            "outlet_address_building": "TEST BUILDING"
        },

        "serial": 13
    },

    {
        "url": "http://localhost:3000/outlets/update_outlet_address/7",

        "test_name": "Test to update the outlet address building to TEST#BUILDING in UPDATE_OUTLET_ADDRESS",

        "test_data": {
            "outlet_address_building": "TEST#BUILDING"
        },

        "serial": 14
    },

    {
        "url": "http://localhost:3000/outlets/update_outlet_address/7",

        "test_name": "Test to update the outlet address street to TEST STREET in UPDATE_OUTLET_ADDRESS",

        "test_data": {
            "outlet_address_street": "TEST STREET"
        },

        "serial": 15
    },

    {
        "url": "http://localhost:3000/outlets/update_outlet_address/7",

        "test_name": "Test to update the outlet address street to TEST#STREET in UPDATE_OUTLET_ADDRESS",

        "test_data": {
            "outlet_address_street": "TEST#STREET"
        },

        "serial": 16
    },

    {
        "url": "http://localhost:3000/outlets/update_outlet_address/7",

        "test_name": "Test to update the outlet address city to TEST CITY in UPDATE_OUTLET_ADDRESS",

        "test_data": {
            "outlet_address_city": "TEST CITY"
        },

        "serial": 17
    },

    {
        "url": "http://localhost:3000/outlets/update_outlet_address/7",

        "test_name": "Test to update the outlet address city to TEST#CITY in UPDATE_OUTLET_ADDRESS",

        "test_data": {
            "outlet_address_city": "TEST#CITY"
        },

        "serial": 18
    },

    {
        "url": "http://localhost:3000/outlets/update_outlet_address/7",

        "test_name": "Test to update the outlet address administrative division to TEST DIVISION in UPDATE_OUTLET_ADDRESS",

        "test_data": {
            "outlet_address_admin_division": "TEST DIVISION"
        },

        "serial": 19
    },

    {
        "url": "http://localhost:3000/outlets/update_outlet_address/7",

        "test_name": "Test to update the outlet address administrative division to TEST#9DIVISION in UPDATE_OUTLET_ADDRESS",

        "test_data": {
            "outlet_address_admin_division": "TEST#9DIVISION"
        },

        "serial": 20
    },

    {
        "url": "http://localhost:3000/outlets/update_outlet_address/7",

        "test_name": "Test to update the outlet address country to United Arab Emirates in UPDATE_OUTLET_ADDRESS",

        "test_data": {
            "outlet_address_country": "United Arab Emirates"
        },

        "serial": 21
    },

    {
        "url": "http://localhost:3000/outlets/update_outlet_address/7",

        "test_name": "Test to update the outlet address country to United8Arab Emirates in UPDATE_OUTLET_ADDRESS",

        "test_data": {
            "outlet_address_country": "United8Arab Emirates"
        },

        "serial": 22
    },


    {
        "url": "http://localhost:3000/outlets/update_outlet_address/7",

        "test_name": "Test to update the outlet address post code to 123456 in UPDATE_OUTLET_ADDRESS",

        "test_data": {
            "outlet_address_post_code": "123456"
        },

        "serial": 23
    },

    {
        "url": "http://localhost:3000/outlets/update_outlet_address/7",

        "test_name": "Test to update the outlet address post code to 123-456 in UPDATE_OUTLET_ADDRESS",

        "test_data": {
            "outlet_address_post_code": "123-456"
        },

        "serial": 24
    },

    {
        "url": "http://localhost:3000/outlets/remove_outlet/10",

        "test_name": "Test to delete the outlet with outlet_id 10 in REMOVE_OUTLET",

        "test_data": {},

        "serial": 25
    },

    {
        "url": "http://localhost:3000/outlets/remove_outlet/7",

        "test_name": "Test to delete the outlet with outlet_id 7 in REMOVE_OUTLET",

        "test_data": {},

        "serial": 26
    },

    {
        "url": "http://localhost:3000/outlets/search_outlets_by_name",

        "test_name": "Test to search for T in SEARCH_OUTLETS_BY_NAME",

        "test_data": {
            "outlet_name": "T"
        },

        "serial": 27   
    },


    {
        "url": "http://localhost:3000/outlets/search_outlets_by_name",

        "test_name": "Test to search for Ti in SEARCH_OUTLETS_BY_NAME",

        "test_data": {
            "outlet_name": "Ti"
        },

        "serial": 28   
    },

    {
        "url": "http://localhost:3000/outlets/search_outlets_by_name",

        "test_name": "Test to search for Tim in SEARCH_OUTLETS_BY_NAME",

        "test_data": {
            "outlet_name": "Tim"
        },

        "serial": 29   
    },

    {
        "url": "http://localhost:3000/outlets/search_outlets_by_name",

        "test_name": "Test to search for Tim's in SEARCH_OUTLETS_BY_NAME",

        "test_data": {
            "outlet_name": "Tim's"
        },

        "serial": 30   
    },

    {
        "url": "http://localhost:3000/outlets/search_outlets_by_name",

        "test_name": "Test to search for Ts in SEARCH_OUTLETS_BY_NAME",

        "test_data": {
            "outlet_name": "Ts"
        },

        "serial": 31   
    },

    {
        "url": "http://localhost:3000/outlets/find_one_outlet/9",
        
        "test_name": "Test to search for an outlet with outlet_id 9 in FIND_ONE_OUTLET",

        "test_data": {},

        "serial": 32
    },

    {
        "url": "http://localhost:3000/outlets/find_one_outlet/8",
        
        "test_name": "Test to search for an outlet with outlet_id 8 in FIND_ONE_OUTLET",

        "test_data": {},

        "serial": 33
    }
]


user_input_string = None
user_choice = None
chosen_test_name = None
chosen_test_url = None
chosen_test_data = None
chosen_test_serial = None

test_menu_name = "======CHAIN INTEGRATION TEST MENU======"

while user_choice != 0:
    userMenuDisplay(test_menu_name, outlet_test_data_list)

    user_input_string = input("\nChoose a test to run or press 0 to exit ")
    user_choice = userInputFilter(user_input_string)
    
    if user_choice == None:
        print("Only numbers allowed as input!!")
        continue
    
    if user_choice > 33:
        print("The user_choice ", user_choice, " is out of range. Please select a test between serial 1 and 33.")
        continue
    
    test_number = user_choice - 1
    chosen_test_name = outlet_test_data_list[test_number]["test_name"]
    chosen_test_url = outlet_test_data_list[test_number]["url"]
    chosen_test_data = outlet_test_data_list[test_number]["test_data"]
    chosen_test_serial = outlet_test_data_list[test_number]["serial"]

    if user_choice >= 1 and user_choice <= 6:
        testDisplay("======CREATE_OUTLET TEST======", test_number, chosen_test_url, chosen_test_name, chosen_test_serial, chosen_test_data)
        response = postRequests(chosen_test_url, chosen_test_data)
        print("\nresponse " + response.text + "\n")
    
    elif user_choice >= 7 and user_choice <= 10:
        testDisplay("======UPDATE_OUTLET_NAME TEST======", test_number, chosen_test_url, chosen_test_name, chosen_test_serial, chosen_test_data)
        response = patchRequests(chosen_test_url, chosen_test_data)
        print("\nresponse " + response.text + "\n")
    
    elif user_choice >= 11 and user_choice <= 24:
        testDisplay("======UPDATE_OUTLET_ADDRESS TEST======", test_number, chosen_test_url, chosen_test_name, chosen_test_serial, chosen_test_data)
        response = patchRequests(chosen_test_url, chosen_test_data)
        print("\nresponse " + response.text + "\n")
    
    elif user_choice >= 25 and user_choice <= 26:
        testDisplay("======REMOVE_OUTLET TEST======", test_number, chosen_test_url, chosen_test_name, chosen_test_serial, chosen_test_data)
        response = deleteRequests(chosen_test_url, chosen_test_data)
        print("\nresponse " + response.text + "\n")
    
    elif user_choice >= 27 and user_choice <= 31:
        testDisplay("======SEARCH_OUTLETS_BY_NAME TEST======", test_number, chosen_test_url, chosen_test_name, chosen_test_serial, chosen_test_data)
        response = postRequests(chosen_test_url, chosen_test_data)
        print("\nresponse " + response.text + "\n")

    elif user_choice >= 32 and user_choice <= 33:
        testDisplay("======FIND_ONE_OUTLET TEST======", test_number, chosen_test_url, chosen_test_name, chosen_test_serial, chosen_test_data)
        response = getRequests(chosen_test_url, chosen_test_data)
        print("\nresponse " + response.text + "\n")
    
    else:     
        if user_choice != 0 and user_choice != None:
            print("User choice out of range.")
            continue
        else:
            print("Exiting...")
            break