-- This is an empty migration.
DROP TRIGGER IF EXISTS trg_replace_deleted_comment_content ON comments;
DROP FUNCTION IF EXISTS replace_deleted_comment_content();