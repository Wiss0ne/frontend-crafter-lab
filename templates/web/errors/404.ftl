<#ftl output_format="HTML" auto_esc=true>
<#import "/templates/system/common/crafter.ftl" as crafter />
<!DOCTYPE html>
<html lang="zh-HK">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>頁面不存在 | HONOR</title>
  <@crafter.head />
  <link rel="stylesheet" href="/static-assets/app/honor/css/honor-clone.css">
  <link rel="stylesheet" href="/static-assets/app/honor/css/honor-cms.css">
</head>
<body class="honor-clone-body">
  <@crafter.body_top />
  <main class="honor-error-page">
    <img src="/static-assets/app/honor/static/img/honor-clone/honor-logo.svg" alt="HONOR">
    <p class="honor-eyebrow">ERROR 404</p>
    <h1>頁面不存在</h1>
    <p>找不到你要瀏覽的頁面。</p>
    <a class="honor-button honor-button--dark" href="/">返回 HONOR 首頁</a>
  </main>
  <@crafter.body_bottom />
</body>
</html>
