<?php
function upload_pdf_file($upload_dir = null)
{
    // مجلد الرفع الافتراضي: نفس فولدر الملف الحالي
    if ($upload_dir === null) {
        $upload_dir = __DIR__;
    }

    // عند الضغط على زر الرفع
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        if (isset($_FILES['pdf_file']) && $_FILES['pdf_file']['error'] === UPLOAD_ERR_OK) {
            $file_name = basename($_FILES['pdf_file']['name']);
            $file_tmp = $_FILES['pdf_file']['tmp_name'];

            // التحقق من الامتداد
            $ext = pathinfo($file_name, PATHINFO_EXTENSION);
            if (strtolower($ext) !== 'pdf') {
                echo "<p style='color:red'>❌ يُسمح فقط برفع ملفات PDF.</p>";
                return false;
            }

            // مكان الحفظ في نفس الفولدر
            $destination = rtrim($upload_dir, DIRECTORY_SEPARATOR) . DIRECTORY_SEPARATOR . $file_name;

            if (move_uploaded_file($file_tmp, $destination)) {
                echo "<p style='color:green'>✅ تم رفع الملف بنجاح: <b>$file_name</b></p>";
                echo "<p>📁 تم حفظه في نفس فولدر الملف.</p>";
                return $destination;
            } else {
                echo "<p style='color:red'>⚠️ حدث خطأ أثناء نقل الملف.</p>";
                return false;
            }
        } else {
            echo "<p style='color:red'>⚠️ لم يتم اختيار ملف أو حدث خطأ أثناء الرفع.</p>";
            return false;
        }
    }
    return null;
}

// استدعاء الدالة بدون مسار: سيتم الحفظ في نفس الفولدر
upload_pdf_file();
?>

<!DOCTYPE html>
<html lang="ar">
<head>
<meta charset="UTF-8">
<title>رفع ملف PDF</title>
<style>
body {
  font-family: Tahoma, sans-serif;
  direction: rtl;
  background: #f4f4f4;
  text-align: center;
  margin-top: 50px;
}
form {
  background: #fff;
  display: inline-block;
  padding: 20px 40px;
  border-radius: 10px;
  box-shadow: 0 0 10px #ccc;
}
input[type="file"] {
  margin-bottom: 15px;
}
button {
  background: #4CAF50;
  color: #fff;
  border: none;
  padding: 10px 20px;
  border-radius: 5px;
  cursor: pointer;
}
button:hover {
  background: #45a049;
}
</style>
</head>
<body>

<h2>📤 رفع ملف PDF</h2>

<form method="post" enctype="multipart/form-data">
  <input type="file" name="pdf_file" accept=".pdf" required><br>
  <button type="submit">رفع الملف</button>
</form>

</body>
</html>
