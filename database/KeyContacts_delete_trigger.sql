CREATE OR REPLACE FUNCTION after_key_contact_delete()
RETURNS TRIGGER AS $$
DECLARE
    deleted_order INT;  -- Declare a variable to store the deleted record's id
BEGIN
    deleted_order := OLD.order_number;

    UPDATE key_contacts SET order_number=order_number-1
    WHERE order_number>deleted_order;
    
    -- Return NULL as this is an AFTER DELETE trigger
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER key_contact_delete_trigger
AFTER DELETE ON key_contacts
FOR EACH ROW
EXECUTE FUNCTION after_key_contact_delete();
