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

  <#if (contentModel.seoDescription_t!'')?has_content>
    <meta
      name="description"
      content="${contentModel.seoDescription_t}"
    >
  </#if>

  <@crafter.head />

  <link
    rel="stylesheet"
    href="/static-assets/app/honor/css/honor-clone.css"
  >
</head>

<body class="honor-clone-body">
  <@crafter.body_top />

  <main class="honor-clone">
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
  </main>

  <script src="/static-assets/app/honor/js/honor-clone.js"></script>

  <@crafter.body_bottom />
</body>
</html>
