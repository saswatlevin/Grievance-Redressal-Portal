from request_functions import *
post_test_data_list = [

    {
        "url": "http://localhost:3000/posts/create_post",

        "test_name": "Test to check response to empty object in CREATE_POST",

        "test_data": {},

        "serial": 1
    },

    {
        "url": "http://localhost:3000/posts/create_post",

        "test_name": "Test to create a post using CREATE_POST",

        "test_data": {
            "post_content": "Test post for user JULF",
            "user_id": 9,
            "post_status": "open",
            "post_title": "JULF Test Post"
        },

        "serial": 2
    },

    {
        "url": "http://localhost:3000/posts/create_post",

        "test_name": "Test to create another post using CREATE_POST",

        "test_data": {
            "post_content": "Test post 2 for user JULF",
            "user_id": 9,
            "post_status": "open",
            "post_title": "JULF Test Post 2"
        },

        "serial": 3
    },

    {
        "url": "http://localhost:3000/posts/create_post",

        "test_name": "Test to create a post with NULL post_title using CREATE_POST",

        "test_data": {
            "post_content": "Test post for user JULF",
            "user_id": 9,
            "post_status": "open",
            "post_title": None
        },

        "serial": 4
    },

    {
        "url": "http://localhost:3000/posts/create_post",

        "test_name": "Test to create a post with NULL post_content using CREATE_POST",

        "test_data": {
            "post_content": None,
            "user_id": 9,
            "post_status": "open",
            "post_title": "JULF Test Post 3"
        },

        "serial": 5
    },

    {
        "url": "http://localhost:3000/posts/update_post_title/8",

        "test_name": "Test to update the post_title of JULF Test Post to JULF TEST POST using UPDATE_POST_TITLE",

        "test_data": {
            "post_title": "JULF TEST POST"
        },

        "serial": 6
    },

    {
        "url": "http://localhost:3000/posts/update_post_title/8",

        "test_name": "Test to update the post_title of JULF TEST POST to JULF TEST POST<> using UPDATE_POST_TITLE",

        "test_data": {
            "post_title": "JULF TEST POST<>"
        },

        "serial": 7
    }, 

        {
        "url": "http://localhost:3000/posts/update_post_title/8",

        "test_name": "Test to update the post_title of JULF TEST POST to empty using UPDATE_POST_TITLE",

        "test_data": {
            "post_title": ""
        },

        "serial": 8
    }, 

    {
        "url": "http://localhost:3000/posts/update_post_content/8",

        "test_name": "Test to update the post_content of JULF TEST POST to Updated test post for user JULF using UPDATE_POST_CONTENT",

        "test_data": {
            "post_content": "Updated test post for user JULF"
        },

        "serial": 9
    },

    {
        "url": "http://localhost:3000/posts/update_post_content/8",

        "test_name": "Test to update the post_content of JULF TEST POST to Updated test post for user JULF <> using UPDATE_POST_CONTENT",

        "test_data": {
            "post_content": "Updated test post for user JULF <>"
        },

        "serial": 10
    },

    {
        "url": "http://localhost:3000/posts/update_post_content/8",

        "test_name": "Test to update the post_content of JULF TEST POST to empty using UPDATE_POST_CONTENT",

        "test_data": {
            "post_content": ""
        },

        "serial": 11
    },

    {
        "url": "http://localhost:3000/posts/update_post_status/8",

        "test_name": "Test to update the post_status of JULF TEST POST to resolved using UPDATE_POST_STATUS",

        "test_data": {
            "post_status": "resolved"
        },

        "serial": 12
    },

    {
        "url": "http://localhost:3000/posts/update_post_status/8",

        "test_name": "Test to update the post_status of JULF TEST POST to empty using UPDATE_POST_STATUS",

        "test_data": {
            "post_status": ""
        },

        "serial": 13
    },

    {
        "url": "http://localhost:3000/posts/search_posts_by_title",

        "test_name": "Test to search for empty using SEARCH_POSTS_BY_TITLE",

        "test_data": {
            "post_title": ""
        },

        "serial": 14
    },

     {
        "url": "http://localhost:3000/posts/search_posts_by_title",

        "test_name": "Search for D in SEARCH_POSTS_BY_TITLE",

        "test_data": {
            "post_title": "D"
        },

        "serial": 15
    },

    {
        "url": "http://localhost:3000/posts/search_posts_by_title",

        "test_name": "Search for DE in SEARCH_POSTS_BY_TITLE",

        "test_data": {
            "post_title": "DE"
        },

        "serial": 16
    },

    {
        "url": "http://localhost:3000/posts/search_posts_by_title",

        "test_name": "Search for DEF in SEARCH_POSTS_BY_TITLE",

        "test_data": {
            "post_title": "DEF"
        },

        "serial": 17
    },

    {
        "url": "http://localhost:3000/posts/search_posts_by_title",

        "test_name": "Search for Post in SEARCH_POSTS_BY_TITLE",

        "test_data": {
            "post_title": "Post"
        },

        "serial": 18
    },

    {
        "url": "http://localhost:3000/posts/search_posts_by_title",

        "test_name": "Search for POST in SEARCH_POSTS_BY_TITLE",

        "test_data": {
            "post_title": "POST"
        },

        "serial": 19
    },

    {
        "url": "http://localhost:3000/posts/remove_post/10",

        "test_name": "Remove post with post_id 10 using REMOVE_POST",

        "test_data": {},

        "serial": 20
    },

    {
        "url": "http://localhost:3000/posts/remove_post/8",

        "test_name": "Remove post with post_id 8 using REMOVE_POST",

        "test_data": {},

        "serial": 21
    },
    
    {
        "url": "http://localhost:3000/posts/find_one_post/4",

        "test_name": "Search for post with post_id 4 using FIND_ONE_POST",

        "test_data": {},

        "serial": 22
    },

    {
        "url": "http://localhost:3000/posts/find_one_post/11",
        
        "test_name": "Search for post with post_id 11 using FIND_ONE_POST",
        
        "test_data": {},
        
        "serial": 23
    },

    {
        "url": "http://localhost:3000/posts/find_all_posts/",
        
        "test_name": "Search for all posts using FIND_ALL_POSTS",
        
        "test_data": {},
        
        "serial": 24
    }

];

user_input_string = None
user_choice = None
chosen_test_name = None
chosen_test_url = None
chosen_test_data = None
chosen_test_serial = None

test_menu_name = "======POST INTEGRATION TEST MENU======"

while user_choice != 0:
    userMenuDisplay(test_menu_name, post_test_data_list)

    user_input_string = input("\nChoose a test to run or press 0 to exit ")
    user_choice = userInputFilter(user_input_string)
    
    if user_choice == None:
        print("Only numbers allowed as input!!")
        continue
    
    if user_choice > 24:
        print("The user_choice ", user_choice, " is out of range. Please select a test between serial 1 and 24.")
        continue
    
    test_number = user_choice - 1
    chosen_test_name = post_test_data_list[test_number]["test_name"]
    chosen_test_url = post_test_data_list[test_number]["url"]
    chosen_test_data = post_test_data_list[test_number]["test_data"]
    chosen_test_serial = post_test_data_list[test_number]["serial"]

    if user_choice >= 1 and user_choice <= 5:
        testDisplay("======CREATE_POST TEST======", test_number, chosen_test_url, chosen_test_name, chosen_test_serial, chosen_test_data)
        response = postRequests(chosen_test_url, chosen_test_data)
        print("\nresponse " + response.text + "\n")
    
    elif user_choice >= 6 and user_choice <= 8:
        testDisplay("======UPDATE_POST_TITLE TEST======", test_number, chosen_test_url, chosen_test_name, chosen_test_serial, chosen_test_data)
        response = patchRequests(chosen_test_url, chosen_test_data)
        print("\nresponse " + response.text + "\n")
    
    elif user_choice >= 9 and user_choice <= 11:
        testDisplay("======UPDATE_POST_CONTENT TEST======", test_number, chosen_test_url, chosen_test_name, chosen_test_serial, chosen_test_data)
        response = patchRequests(chosen_test_url, chosen_test_data)
        print("\nresponse " + response.text + "\n")

    elif user_choice >= 12 and user_choice <= 13:
        testDisplay("======UPDATE_POST_STATUS TEST======", test_number, chosen_test_url, chosen_test_name, chosen_test_serial, chosen_test_data)
        response = patchRequests(chosen_test_url, chosen_test_data)
        print("\nresponse " + response.text + "\n")
    
    elif user_choice >= 14 and user_choice <= 19:
        testDisplay("======SEARCH_POSTS_BY_TITLE TEST======", test_number, chosen_test_url, chosen_test_name, chosen_test_serial, chosen_test_data)
        response = getRequests(chosen_test_url, chosen_test_data)
        print("\nresponse " + response.text + "\n")
    
    elif user_choice >= 20 and user_choice <= 21:
        testDisplay("======REMOVE_POST TEST======", test_number, chosen_test_url, chosen_test_name, chosen_test_serial, chosen_test_data)
        response = deleteRequests(chosen_test_url, chosen_test_data)
        print("\nresponse " + response.text + "\n")
    
    elif user_choice >= 22 and user_choice <= 23:
        testDisplay("======FIND_ONE_POST TEST======", test_number, chosen_test_url, chosen_test_name, chosen_test_serial, chosen_test_data)
        response = getRequests(chosen_test_url, chosen_test_data)
        print("\nresponse " + response.text + "\n")
    
    elif user_choice == 24:
        testDisplay("======FIND_ALL_POSTS TEST======", test_number, chosen_test_url, chosen_test_name, chosen_test_serial, chosen_test_data)
        response = getRequests(chosen_test_url, chosen_test_data)
        print("\nresponse " + response.text + "\n")
    
    else:     
        if user_choice != 0 and user_choice != None:
            print("User choice out of range.")
            continue
        else:
            print("Exiting...")
            break