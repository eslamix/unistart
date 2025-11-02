<?php
/*
Plugin Name: PDF Upload for Listings
Description: Allows users to upload a PDF file with their listing.
Version: 1.0
Author: Eslam
*/

// لما المستخدم يضيف إعلان
osc_add_hook('post_item', 'pdf_upload_handle');

function pdf_upload_handle($item) {
    if (!empty($_FILES['pdf_file']['name'])) {
        $upload_dir = osc_base_path() . 'oc-content/uploads/pdfs/';
        if (!file_exists($upload_dir)) {
            mkdir($upload_dir, 0777, true);
        }

        $file_name = time() . '_' . basename($_FILES['pdf_file']['name']);
        $target_path = $upload_dir . $file_name;

        if (move_uploaded_file($_FILES['pdf_file']['tmp_name'], $target_path)) {
            // حفظ مسار الملف في بيانات الإعلان (custom field)
            Item::newInstance()->update(
                array('s_contact_name' => $file_name), // أو حقل مخصص
                array('pk_i_id' => $item['pk_i_id'])
            );
        } else {
            error_log("PDF Upload failed for item " . $item['pk_i_id']);
        }
    }
}
?>
