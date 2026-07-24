<#import "/templates/system/common/crafter.ftl" as crafter />

<!DOCTYPE html>
<html lang="zh-HK">
<head>
  <meta charset="UTF-8">
  <meta
    name="viewport"
    content="width=device-width, initial-scale=1.0"
  >

  <title>${contentModel.browserTitle_s!'HONOR 香港'}</title>

  <#assign seoDescription = (contentModel.sEODescription_t)!((contentModel.seoDescription_t)!'')>
  <#if seoDescription?has_content>
    <meta
      name="description"
      content="${seoDescription}"
    >
  </#if>

  <@crafter.head />

  <link
    rel="stylesheet"
    href="/static-assets/app/honor/css/honor-clone.css"
  >
  <link
    rel="stylesheet"
    href="/static-assets/app/honor/css/honor-cms.css"
  >
</head>

<body class="honor-clone-body">
  <@crafter.body_top />

  <a class="honor-skip-link" href="#honor-main">跳至主要內容</a>

  <div class="honor-clone-header" role="banner">
    <div class="honor-clone-header__inner">
      <a class="honor-clone-header__logo" href="#honor-main" aria-label="HONOR 首頁">
        <img src="/static-assets/app/honor/static/img/honor-clone/honor-logo.svg" alt="HONOR">
      </a>

      <nav class="honor-clone-nav" aria-label="主要導覽">
        <a href="#honor-products">手機</a>
        <a href="#honor-products">手提電腦</a>
        <a href="#honor-products">平板</a>
        <a href="#honor-products">穿戴</a>
        <a href="#honor-products">更多產品</a>
        <a href="#honor-technology">MagicOS</a>
        <a href="#honor-technology">HONOR AI <span class="honor-ai-mark">✦</span></a>
        <a href="#honor-support">服務支援</a>
        <a href="#honor-events">探索</a>
        <a href="#honor-support">HONOR體驗店</a>
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
      <a href="#honor-products">手機</a>
      <a href="#honor-products">手提電腦</a>
      <a href="#honor-products">平板</a>
      <a href="#honor-products">穿戴</a>
      <a href="#honor-technology">MagicOS 與 HONOR AI</a>
      <a href="#honor-support">服務支援</a>
    </div>
  </div>

  <main id="honor-main" class="honor-clone">
    <section class="honor-hero" aria-label="精選產品">
      <div class="honor-hero__track">
        <#if contentModel.heroSlides_o??
          && contentModel.heroSlides_o.item??>

          <#list contentModel.heroSlides_o.item as slide>
            <@renderComponent
              component=slide
              additionalModel={
                "isActive": slide?index == 0
              }
            />
          </#list>
        </#if>
      </div>

      <div class="honor-hero__controls">
        <button
          class="honor-hero-arrow honor-hero-arrow--prev"
          type="button"
          aria-label="上一張"
        >
          <span>‹</span>
        </button>

        <div
          class="honor-hero__dots"
          role="group"
          aria-label="選擇精選產品"
        >
          <#if contentModel.heroSlides_o??
            && contentModel.heroSlides_o.item??>

            <#list contentModel.heroSlides_o.item as slide>
              <button
                <#if slide?index == 0>
                  class="is-active"
                </#if>
                type="button"
                aria-pressed="${(slide?index == 0)?c}"
                aria-label="顯示第 ${slide?index + 1} 張精選產品"
              ></button>
            </#list>
          </#if>
        </div>

        <button
          class="honor-hero-arrow honor-hero-arrow--next"
          type="button"
          aria-label="下一張"
        >
          <span>›</span>
        </button>
      </div>
    </section>

    <#if contentModel.featureCards_o?? && contentModel.featureCards_o.item??>
      <#list contentModel.featureCards_o.item as card>
        <@renderComponent component=card />
      </#list>
    </#if>

    <#if contentModel.productCards_o?? && contentModel.productCards_o.item??>
      <section id="honor-products" class="honor-products honor-section">
        <div class="honor-section__heading">
          <p class="honor-eyebrow">${contentModel.productsEyebrow_s!'DISCOVER'}</p>
          <h2>${contentModel.productsTitle_t!'所有產品'}</h2>
        </div>

        <div class="honor-product-tabs" role="tablist" aria-label="產品分類">
          <button class="is-active" type="button" role="tab" aria-pressed="true" data-product-filter="all">最新產品</button>
          <button type="button" role="tab" aria-pressed="false" data-product-filter="phone">手機</button>
          <button type="button" role="tab" aria-pressed="false" data-product-filter="laptop">手提電腦</button>
          <button type="button" role="tab" aria-pressed="false" data-product-filter="tablet">平板</button>
          <button type="button" role="tab" aria-pressed="false" data-product-filter="wearable">穿戴</button>
        </div>

        <div class="honor-product-grid" aria-live="polite">
          <#list contentModel.productCards_o.item as card>
            <@renderComponent component=card />
          </#list>
        </div>
      </section>
    </#if>

    <#if contentModel.eventCards_o?? && contentModel.eventCards_o.item??>
      <section id="honor-events" class="honor-events honor-section">
        <div class="honor-section__heading honor-section__heading--row">
          <div>
            <p class="honor-eyebrow">${contentModel.eventsEyebrow_s!"WHAT'S NEW"}</p>
            <h2>${contentModel.eventsTitle_t!'HONOR 最新活動'}</h2>
          </div>
          <#if (contentModel.eventsLinkLabel_s!'')?has_content>
            <a class="honor-text-link" href="${contentModel.eventsLinkURL_s!'#honor-technology'}">
              ${contentModel.eventsLinkLabel_s} <span>›</span>
            </a>
          </#if>
        </div>

        <div class="honor-events__list">
          <#list contentModel.eventCards_o.item as card>
            <@renderComponent component=card />
          </#list>
        </div>
      </section>
    </#if>

    <#if contentModel.technologyCards_o?? && contentModel.technologyCards_o.item??>
      <section id="honor-technology" class="honor-technology honor-section">
        <div class="honor-section__heading">
          <p class="honor-eyebrow">${contentModel.technologyEyebrow_s!'INNOVATION'}</p>
          <h2>${contentModel.technologyTitle_t!'HONOR科技，引領未來'}</h2>
        </div>

        <div class="honor-technology__grid">
          <#list contentModel.technologyCards_o.item as card>
            <@renderComponent component=card />
          </#list>
        </div>
      </section>
    </#if>
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
          <a href="#honor-events">關於我們</a>
          <a href="#honor-technology">HONOR ESG</a>
        </div>
      </section>
      <section>
        <button type="button" aria-expanded="false">產品 <span>＋</span></button>
        <div>
          <a href="#honor-products">手機</a>
          <a href="#honor-products">手提電腦</a>
          <a href="#honor-products">平板</a>
          <a href="#honor-products">穿戴</a>
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
          <a href="#honor-technology">MagicOS</a>
          <a href="#honor-technology">HONOR AI</a>
          <a href="#honor-technology">HONOR 換機</a>
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

  <@crafter.body_bottom />
</body>
</html>
