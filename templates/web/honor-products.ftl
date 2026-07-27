<#ftl output_format="HTML" auto_esc=true>
<#import "/templates/system/common/crafter.ftl" as crafter />
<#assign honorHomeUrl = '/'>
<#if siteContext?? && siteContext.siteName??>
  <#assign honorHomeUrl = '/?crafterSite=' + siteContext.siteName>
</#if>

<!DOCTYPE html>
<html lang="zh-HK">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>${contentModel.browserTitle_s!'HONOR 產品 | HONOR 香港'}</title>

  <#assign seoDescription = (contentModel.sEODescription_t)!((contentModel.seoDescription_t)!'')>
  <#if seoDescription?has_content>
    <meta name="description" content="${seoDescription}">
  </#if>

  <@crafter.head />

  <link rel="stylesheet" href="/static-assets/app/honor/css/honor-clone.css">
  <link rel="stylesheet" href="/static-assets/app/honor/css/honor-cms.css">
  <link rel="stylesheet" href="/static-assets/app/honor/css/honor-products.css">
</head>

<body class="honor-clone-body honor-products-body">
  <@crafter.body_top />

  <a class="honor-skip-link" href="#honor-main">跳至主要內容</a>

  <div class="honor-clone-header" role="banner">
    <div class="honor-clone-header__inner">
      <a class="honor-clone-header__logo" href="${honorHomeUrl}" aria-label="HONOR 首頁">
        <img src="/static-assets/app/honor/static/img/honor-clone/honor-logo.svg" alt="HONOR">
      </a>

      <nav class="honor-clone-nav" aria-label="主要導覽">
        <a href="#honor-products" data-catalog-filter-link="phone">手機</a>
        <a href="#honor-products" data-catalog-filter-link="laptop">手提電腦</a>
        <a href="#honor-products" data-catalog-filter-link="tablet">平板</a>
        <a href="#honor-products" data-catalog-filter-link="wearable">穿戴</a>
        <a href="#honor-products" data-catalog-filter-link="audio">音響</a>
        <a href="#honor-products" data-catalog-filter-link="all">所有產品</a>
        <a href="${honorHomeUrl}#honor-technology">MagicOS</a>
        <a href="${honorHomeUrl}#honor-technology">HONOR AI <span class="honor-ai-mark">✦</span></a>
        <a href="#honor-support">服務支援</a>
      </nav>

      <div class="honor-clone-header__actions" aria-label="網站工具">
        <button class="honor-icon-button" type="button" aria-label="搜尋">
          <svg viewBox="0 0 24 24" aria-hidden="true">
            <circle cx="11" cy="11" r="6.5"></circle>
            <path d="m16 16 4.2 4.2"></path>
          </svg>
        </button>
        <button class="honor-icon-button honor-menu-button" type="button" aria-label="開啟選單" aria-expanded="false">
          <span></span><span></span>
        </button>
      </div>
    </div>

    <div class="honor-mobile-nav" aria-hidden="true">
      <a href="#honor-products" data-catalog-filter-link="phone">手機</a>
      <a href="#honor-products" data-catalog-filter-link="laptop">手提電腦</a>
      <a href="#honor-products" data-catalog-filter-link="tablet">平板</a>
      <a href="#honor-products" data-catalog-filter-link="wearable">穿戴</a>
      <a href="#honor-products" data-catalog-filter-link="audio">音響</a>
      <a href="#honor-products" data-catalog-filter-link="all">所有產品</a>
    </div>
  </div>

  <main id="honor-main" class="honor-clone honor-products-page">
    <header class="honor-catalog-hero">
      <div class="honor-catalog-hero__copy">
        <#if (contentModel.catalogEyebrow_s!'')?has_content>
          <p class="honor-eyebrow">${contentModel.catalogEyebrow_s}</p>
        </#if>
        <h1>${contentModel.catalogTitle_t!'探索 HONOR 全系列產品'}</h1>
        <#if (contentModel.catalogIntro_t!'')?has_content>
          <p>${contentModel.catalogIntro_t}</p>
        </#if>
      </div>
    </header>

    <section id="honor-products" class="honor-products honor-section" aria-labelledby="honor-products-title">
      <div class="honor-section__heading">
        <p class="honor-eyebrow">DISCOVER</p>
        <h2 id="honor-products-title">所有產品</h2>
      </div>

      <div class="honor-product-tabs" role="group" aria-label="產品分類">
        <button class="is-active" type="button" aria-pressed="true" data-product-filter="all">最新產品</button>
        <button type="button" aria-pressed="false" data-product-filter="phone">手機</button>
        <button type="button" aria-pressed="false" data-product-filter="laptop">手提電腦</button>
        <button type="button" aria-pressed="false" data-product-filter="tablet">平板</button>
        <button type="button" aria-pressed="false" data-product-filter="wearable">穿戴</button>
        <button type="button" aria-pressed="false" data-product-filter="audio">音響</button>
      </div>

      <div class="honor-product-grid" aria-live="polite">
        <#if contentModel.productCards_o?? && contentModel.productCards_o.item??>
          <#list contentModel.productCards_o.item as card>
            <@renderComponent component=card />
          </#list>
        <#else>
          <div class="honor-catalog-empty">
            <strong>暫未加入產品</strong>
            <span>請在 Crafter 表單的 Product Cards 欄位新增產品卡。</span>
          </div>
        </#if>
      </div>
    </section>
  </main>

  <div id="honor-support" class="honor-clone-footer" role="contentinfo">
    <div class="honor-clone-footer__service">
      <div>
        <strong>需要協助？</strong>
        <span>探索產品支援、保養政策及服務中心。</span>
      </div>
      <a class="honor-button honor-button--outline" href="#honor-main">聯絡我們</a>
    </div>

    <div class="honor-clone-footer__links">
      <section>
        <button type="button" aria-expanded="false">關於HONOR <span>＋</span></button>
        <div>
          <a href="${honorHomeUrl}">關於我們</a>
          <a href="${honorHomeUrl}#honor-technology">HONOR ESG</a>
        </div>
      </section>
      <section>
        <button type="button" aria-expanded="false">產品 <span>＋</span></button>
        <div>
          <a href="#honor-products" data-catalog-filter-link="phone">手機</a>
          <a href="#honor-products" data-catalog-filter-link="laptop">手提電腦</a>
          <a href="#honor-products" data-catalog-filter-link="tablet">平板</a>
          <a href="#honor-products" data-catalog-filter-link="wearable">穿戴</a>
        </div>
      </section>
      <section>
        <button type="button" aria-expanded="false">服務支援 <span>＋</span></button>
        <div>
          <a href="#honor-support">服務中心</a>
          <a href="#honor-support">權益查詢</a>
          <a href="#honor-support">保養政策</a>
        </div>
      </section>
      <section>
        <button type="button" aria-expanded="false">軟件和應用程式 <span>＋</span></button>
        <div>
          <a href="${honorHomeUrl}#honor-technology">MagicOS</a>
          <a href="${honorHomeUrl}#honor-technology">HONOR AI</a>
          <a href="${honorHomeUrl}#honor-technology">HONOR 換機</a>
        </div>
      </section>
    </div>

    <div class="honor-clone-footer__bottom">
      <img src="/static-assets/app/honor/static/img/honor-clone/honor-logo.svg" alt="HONOR">
      <p>此頁為前端視覺復刻示例，未連接真實購買、帳戶或客服服務。</p>
      <div>
        <a href="#honor-main">網站地圖</a>
        <a href="#honor-main">使用條款</a>
        <a href="#honor-main">私隱政策</a>
      </div>
    </div>
  </div>

  <button class="honor-back-top" type="button" aria-label="返回頂部">↑</button>

  <script src="/static-assets/app/honor/js/honor-clone.js"></script>
  <script src="/static-assets/app/honor/js/honor-products.js"></script>

  <@crafter.body_bottom />
</body>
</html>
