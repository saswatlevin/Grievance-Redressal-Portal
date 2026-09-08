from request_functions import *
comment_test_data_list = [
   
   {
        "url": "http://localhost:3000/comments/create_comment",

        "test_name": "Test to check response to empty object in CREATE_COMMENT",

        "test_data": {},

        "serial": 1
    },

    {
        "url": "http://localhost:3000/comments/create_comment",

        "test_name": "Test to check response to create a comment for user_id 7 post_id 4 using CREATE_COMMENT",

        "test_data": {
            "comment_content": "Second child-less comment from user_id 7 for post_id 4 with comment_id 15",
            "user_id": 7,
            "post_id": 4
        },

        "serial": 2
    },

    {
        "url": "http://localhost:3000/comments/create_comment",

        "test_name": "Test to check response to create a comment with unsupported characters in comment_content for user_id 7 post_id 4 using CREATE_COMMENT",

        "test_data": {
            "comment_content": "Third child-less comment <> from user_id 7 for post_id 4 with comment_id 16",
            "user_id": 7,
            "post_id": 4
        },

        "serial": 3
    },

    {
        "url": "http://localhost:3000/comments/create_comment",

        "test_name": "Test to check response to create a comment for user_id NULL post_id 4 using CREATE_COMMENT",

        "test_data": {
            "comment_content": "Fourth child-less comment from user_id NULL for post_id 4 with comment_id 17",
            "user_id": None,
            "post_id": 4
        },

        "serial": 4
    },

    {
        "url": "http://localhost:3000/comments/create_comment",

        "test_name": "Test to check response to create a comment for user_id 7 post_id NULL using CREATE_COMMENT",

        "test_data": {
            "comment_content": "Fifth child-less comment from user_id 7 for post_id NULL with comment_id 18",
            "user_id": 7,
            "post_id": None
        },

        "serial": 5
    },

       {
        "url": "http://localhost:3000/comments/create_reply",

        "test_name": "Test to check response to empty object in CREATE_REPLY",

        "test_data": {},

        "serial": 6
    },

    {
        "url": "http://localhost:3000/comments/create_reply",

        "test_name": "Test to check response to create a reply to comment with comment_id 15 for user_id 7, post_id 4 and parent_id 15 using CREATE_REPLY",

        "test_data": {
            "comment_content": "Reply ONE to Second child-less comment from user_id 8 for post_id 4 with comment_id 16",
            "parent_id": 15,
            "user_id": 8,
            "post_id": 4
        },

        "serial": 7
    },

    {
        "url": "http://localhost:3000/comments/create_reply",

        "test_name": "Test to check response to create another reply to comment with comment_id 15 for user_id 7, post_id 4 and parent_id 15 using CREATE_REPLY",

        "test_data": {
            "comment_content": "Reply TWO to Second child-less comment from user_id 8 for post_id 4 with parent_id 15 and comment_id 17",
            "parent_id": 15,
            "user_id": 8,
            "post_id": 4
        },

        "serial": 8
    },

    {
        "url": "http://localhost:3000/comments/create_reply",

        "test_name": "Test to check response to create a reply to comment with comment_id 15 for user_id NULL, post_id 4 and parent_id 15 using CREATE_REPLY",

        "test_data": {
            "comment_content": "Reply THREE to Second child-less comment from user_id NULL for post_id 4 with parent_id 15 and comment_id 18",
            "parent_id": 15,
            "user_id": None,
            "post_id": 4
        },

        "serial": 9
    },

    {
        "url": "http://localhost:3000/comments/create_reply",

        "test_name": "Test to check response to create a reply to comment with comment_id 15 for user_id 7, post_id NULL and parent_id 15 using CREATE_REPLY",

        "test_data": {
            "comment_content": "Reply FOUR to Second child-less comment from user_id 7 for post_id NULL with parent_id 15 and comment_id 19",
            "parent_id": 15,
            "user_id": 7,
            "post_id": None
        },

        "serial": 10
    },

    {
        "url": "http://localhost:3000/comments/create_reply",

        "test_name": "Test to check response to create a reply to comment with comment_id 15 for user_id 7, post_id 4 and parent_id NULL using CREATE_REPLY",

        "test_data": {
            "comment_content": "Reply FOUR to Second child-less comment from user_id 7 for post_id 4 with parent_id NULL and comment_id 20",
            "parent_id": None,
            "user_id": 7,
            "post_id": 4
        },

        "serial": 11
    },

    {
        "url": "http://localhost:3000/comments/update_comment_content/15",

        "test_name": "Test to update the comment_content of comment with comment_id 15 using UPDATE_COMMENT_CONTENT",

        "test_data": {
            "comment_content": "UPDATED Second child-less comment from user_id 7 for post_id 4 with comment_id 15"
        },

        "serial": 12
    },

    {
        "url": "http://localhost:3000/comments/update_comment_content/16",

        "test_name": "Test to update the comment_content of comment with comment_id 16 using UPDATE_COMMENT_CONTENT",

        "test_data": {
            "comment_content": "UPDATED Reply ONE to Second child-less comment from user_id 8 for post_id 4 with comment_id 16"
        },

        "serial": 13
    },

    {
        "url": "http://localhost:3000/comments/update_comment_content/15",

        "test_name": "Test to update the comment_content with empty request body using UPDATE_COMMENT_CONTENT",

        "test_data": {},

        "serial": 14
    },

    {
        "url": "http://localhost:3000/comments/update_comment_content",

        "test_name": "Test to update the comment_content with NULL comment_id using UPDATE_COMMENT_CONTENT",

        "test_data": {
            "comment_content": "UPDATED TEXT"
        },

        "serial": 15
    },

    {
        "url": "http://localhost:3000/comments/soft_delete_comment/15",

        "test_name": "Test to soft-delete comment with comment_id 15 using SOFT_DELETE_COMMENT",

        "test_data": {
            "comment_is_deleted": True
        },

        "serial": 16
    },

    {
        "url": "http://localhost:3000/comments/soft_delete_comment/15",

        "test_name": "Test to soft-delete comment with NULL comment_is_deleted value using SOFT_DELETE_COMMENT",

        "test_data": {
            "comment_is_deleted": None
        },

        "serial": 17
    },

    {
        "url": "http://localhost:3000/comments/soft_delete_comment",

        "test_name": "Test to soft-delete comment with comment_id NULL using SOFT_DELETE_COMMENT",

        "test_data": {
            "comment_is_deleted": True
        },

        "serial": 18
    },

    {
        "url": "http://localhost:3000/comments/hard_delete_comment/15",

        "test_name": "Test to hard-delete comment with comment_id 15 using HARD_DELETE_COMMENT",

        "test_data": {},

        "serial": 19
    },

    {
        "url": "http://localhost:3000/comments/hard_delete_comment/16",

        "test_name": "Test to hard-delete comment with comment_id 16 using HARD_DELETE_COMMENT",

        "test_data": {},

        "serial": 20
    },

    {
        "url": "http://localhost:3000/comments/hard_delete_comment",

        "test_name": "Test to hard-delete comment with comment_id NULL using HARD_DELETE_COMMENT",

        "test_data": {},

        "serial": 21
    },

    {
        "url": "http://localhost:3000/comments/display_all_post_comments/4",

        "test_name": "Test to display all comments of post with post_id 4 using DISPLAY_ALL_POST_COMMENTS",

        "test_data": {},

        "serial": 22
    },

    {
        "url": "http://localhost:3000/comments/display_all_post_comments",

        "test_name": "Test to display all comments of post with post_id NULL using DISPLAY_ALL_POST_COMMENTS",

        "test_data": {},

        "serial": 23
    },


    {
        "url": "http://localhost:3000/comments/search_comments_by_post/4",

        "test_name": "Test to search for comments by post_id 4 and comment_content P using SEARCH_COMMENTS_BY_POST",

        "test_data": {
            "comment_content": "P"
        },

        "serial": 24
    },

    {
        "url": "http://localhost:3000/comments/search_comments_by_post/4",

        "test_name": "Test to search for comments by post_id 4 and comment_content c using SEARCH_COMMENTS_BY_POST",

        "test_data": {
            "comment_content": "c"
        },

        "serial": 25
    },

    {
        "url": "http://localhost:3000/comments/search_comments_by_post/4",

        "test_name": "Test to search for comments by post_id 4 and comment_content co using SEARCH_COMMENTS_BY_POST",

        "test_data": {
            "comment_content": "co"
        },

        "serial": 26
    },

    {
        "url": "http://localhost:3000/comments/search_comments_by_post/4",

        "test_name": "Test to search for comments by post_id 4 and comment_content e using SEARCH_COMMENTS_BY_POST",

        "test_data": {
            "comment_content": "e"
        },

        "serial": 27
    },

    {
        "url": "http://localhost:3000/comments/search_comments_by_post/4",

        "test_name": "Test to search for comments by post_id 4 and comment_content ep using SEARCH_COMMENTS_BY_POST",

        "test_data": {
            "comment_content": "ep"
        },

        "serial": 28
    },

    {
        "url": "http://localhost:3000/comments/search_comments_by_post/4",

        "test_name": "Test to search for comments by post_id 4 and comment_content a using SEARCH_COMMENTS_BY_POST",

        "test_data": {
            "comment_content": "a"
        },

        "serial": 29
    },

    {
        "url": "http://localhost:3000/comments/search_comments_by_post/4",

        "test_name": "Test to search for comments by post_id 4 and comment_content bc using SEARCH_COMMENTS_BY_POST",

        "test_data": {
            "comment_content": "bc"
        },

        "serial": 30
    },
];

# createComment          -> 01 to 05
# createReply            -> 06 to 11
# updateCommentContent   -> 12 to 15
# softDeleteComment      -> 16 to 18
# hardDeleteComment      -> 19 to 21
# displayAllPostComments -> 22 to 23
# searchCommentsByPost   -> 24 to 30

user_input_string = None
user_choice = None
chosen_test_name = None
chosen_test_url = None
chosen_test_data = None
chosen_test_serial = None

test_menu_name = "======COMMENT INTEGRATION TEST MENU======"

while user_choice != 0:
    userMenuDisplay(test_menu_name, comment_test_data_list)

    user_input_string = input("\nChoose a test to run or press 0 to exit ")
    user_choice = userInputFilter(user_input_string)
    
    if user_choice == None:
        print("Only numbers allowed as input!!")
        continue
    
    if user_choice > 30:
        print("The user_choice ", user_choice, " is out of range. Please select a test between serial 1 and 30.")
        continue
    
    test_number = user_choice - 1
    chosen_test_name = comment_test_data_list[test_number]["test_name"]
    chosen_test_url = comment_test_data_list[test_number]["url"]
    chosen_test_data = comment_test_data_list[test_number]["test_data"]
    chosen_test_serial = comment_test_data_list[test_number]["serial"]

    if user_choice >= 1 and user_choice <= 5:
        testDisplay("======CREATE_COMMENT TEST======", test_number, chosen_test_url, chosen_test_name, chosen_test_serial, chosen_test_data)
        response = postRequests(chosen_test_url, chosen_test_data)
        print("\nresponse " + response.text + "\n")
    
    elif user_choice >= 6 and user_choice <= 11:
        testDisplay("======CREATE_REPLY TEST======", test_number, chosen_test_url, chosen_test_name, chosen_test_serial, chosen_test_data)
        response = postRequests(chosen_test_url, chosen_test_data)
        print("\nresponse " + response.text + "\n")
    
    elif user_choice >= 12 and user_choice <= 15:
        testDisplay("======UPDATE_COMMENT_CONTENT TEST======", test_number, chosen_test_url, chosen_test_name, chosen_test_serial, chosen_test_data)
        response = patchRequests(chosen_test_url, chosen_test_data)
        print("\nresponse " + response.text + "\n")
    
    elif user_choice >= 16 and user_choice <= 18:
        testDisplay("======SOFT_DELETE_COMMENT TEST======", test_number, chosen_test_url, chosen_test_name, chosen_test_serial, chosen_test_data)
        response = patchRequests(chosen_test_url, chosen_test_data)
        print("\nresponse " + response.text + "\n")
    
    elif user_choice >= 19 and user_choice <= 21:
        testDisplay("======HARD_DELETE_COMMENT TEST======", test_number, chosen_test_url, chosen_test_name, chosen_test_serial, chosen_test_data)
        response = deleteRequests(chosen_test_url, chosen_test_data)
        print("\nresponse " + response.text + "\n")
    
    elif user_choice >= 22 and user_choice <= 23:
        testDisplay("======DISPLAY_ALL_POST_COMMENTS TEST======", test_number, chosen_test_url, chosen_test_name, chosen_test_serial, chosen_test_data)
        response = getRequests(chosen_test_url, chosen_test_data)
        print("\nresponse " + response.text + "\n")

    elif user_choice >= 24 and user_choice <= 30:
        testDisplay("======SEARCH_COMMENTS_BY_POST TEST======", test_number, chosen_test_url, chosen_test_name, chosen_test_serial, chosen_test_data)
        response = getRequests(chosen_test_url, chosen_test_data)
        print("\nresponse " + response.text + "\n")
    
    else:     
        if user_choice != 0 and user_choice != None:
            print("User choice out of range.")
            continue
        else:
            print("Exiting...")
            break