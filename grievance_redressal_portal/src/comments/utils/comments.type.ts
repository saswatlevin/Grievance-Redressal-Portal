export type Comment = {
            comment_id: number;
            parent_id: number | null;
            comment_date_created_at: Date;
            comment_content: string;
            comment_is_deleted: boolean;
};