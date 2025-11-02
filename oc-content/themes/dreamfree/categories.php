<?php
osc_current_web_theme_path('header.php');
?>

<h2 style="margin-bottom:20px;"><?php _e('كل الجامعات', 'dreamfree'); ?></h2>

<div class="categories-grid">
    <?php
    // جلب كل الأقسام
    $categories = Category::newInstance()->listAll();
    $has_main = false;

    if(count($categories) > 0) {
        foreach($categories as $cat) {
            // التحقق إذا كان نوع المشروع رئيسي (بدون أب)
            if(empty($cat['fk_i_parent_id']) || $cat['fk_i_parent_id'] == 0) {
                $has_main = true;
                $cat_name = $cat['s_name'];
                $cat_url  = osc_search_category_url($cat['pk_i_id']);
                $cat_icon = isset($cat['s_icon']) ? $cat['s_icon'] : ''; // في حالة موجود عمود للأيقونة
                $img_url  = $cat_icon ? $cat_icon : 'https://via.placeholder.com/150'; // صورة افتراضية
                ?>
                <a href="<?php echo $cat_url; ?>" class="category-card">
                    <div class="card-image">
                        <img src="<?php echo $img_url; ?>" alt="<?php echo osc_esc_html($cat_name); ?>">
                    </div>
                    <div class="card-name"><?php echo osc_esc_html($cat_name); ?></div>
                </a>
                <?php
            }
        }

        if(!$has_main) {
            echo '<p>' . __('No main categories found', 'dreamfree') . '</p>';
        }
    } else {
        _e('No categories found', 'dreamfree');
    }
    ?>
</div>

<style>
.categories-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(180px, 1fr));
    gap: 25px;
}
.category-card {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-decoration: none;
    background: #fff;
    border-radius: 15px;
    padding: 20px;
    box-shadow: 0 6px 20px rgba(0,0,0,0.12);
    transition: transform 0.3s, box-shadow 0.3s;
}
.category-card:hover {
    transform: translateY(-7px);
    box-shadow: 0 12px 30px rgba(0,0,0,0.18);
}
.card-image img {
    width: 120px;
    height: 120px;
    object-fit: cover;
    border-radius: 12px;
    margin-bottom: 12px;
    border: 2px solid #eee;
}
.card-name {
    font-weight: 700;
    color: #333;
    text-align: center;
    font-size: 16px;
}
</style>

<?php
osc_current_web_theme_path('footer.php');
?>
