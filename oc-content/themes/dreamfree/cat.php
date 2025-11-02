<?php
osc_current_web_theme_path('header.php');
?>

<h2 style="margin-bottom:20px;"><?php _e('كل الاقسام', 'dreamfree'); ?></h2>

<div class="categories-grid">
    <?php
    $countries = Country::newInstance()->listAll(); // جلب كل الدول
    if(count($countries) > 0) {
        foreach($countries as $country) {
            $country_name = $country['s_name'];        
            $country_url  = osc_search_url(array('sCountry' => $country_name)); 
            $country_code = $country['s_phone_code'];  

            // تحديد رابط الصورة
            if(str_starts_with($country_code, 'http://') || str_starts_with($country_code, 'https://')) {
                $img_url = $country_code; // رابط كامل
            } else {
                $img_url = osc_current_web_theme_url('images/country_flags/' . $country_code . '.png'); // كود الدولة
            }
            ?>
            <a href="<?php echo $country_url; ?>" class="category-card">
                <div class="card-image">
                    <img src="<?php echo $img_url; ?>" alt="<?php echo $country_name; ?>">
                </div>
                <div class="card-name"><?php echo $country_name; ?></div>
            </a>
            <?php
        }
    } else {
        _e('No countries found', 'dreamfree');
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
