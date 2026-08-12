-- This is an empty migration.
-- CreateFunction
CREATE OR REPLACE FUNCTION replace_deleted_comment_content()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.comment_is_deleted = true THEN
        NEW.comment_content := 'This comment has been deleted';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- CreateTrigger
CREATE TRIGGER trg_replace_deleted_comment_content
BEFORE UPDATE ON comments
FOR EACH ROW
EXECUTE FUNCTION replace_deleted_comment_content();