<#ftl output_format="HTML" auto_esc=true>
<#import "/templates/system/common/crafter.ftl" as crafter />
<!DOCTYPE html>
<html lang="zh-HK">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>服務暫時不可用 | HONOR</title>
  <@crafter.head />
  <link rel="stylesheet" href="/static-assets/app/honor/css/honor-clone.css">
  <link rel="stylesheet" href="/static-assets/app/honor/css/honor-cms.css">
</head>
<body class="honor-clone-body">
  <@crafter.body_top />
  <main class="honor-error-page">
    <img src="/static-assets/app/honor/static/img/honor-clone/honor-logo.svg" alt="HONOR">
    <p class="honor-eyebrow">ERROR 500</p>
    <h1>服務暫時不可用</h1>
    <p>網站暫時未能完成請求，請稍後再試。</p>
    <a class="honor-button honor-button--dark" href="/">返回 HONOR 首頁</a>
  </main>
  <@crafter.body_bottom />
</body>
</html>
