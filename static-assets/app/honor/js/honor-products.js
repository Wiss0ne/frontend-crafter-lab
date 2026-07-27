(() => {
  "use strict";

  const catalog = document.querySelector(".honor-products-page");
  if (!catalog) return;

  const filterButtons = Array.from(
    catalog.querySelectorAll("[data-product-filter]"),
  );
  const filterLinks = Array.from(
    document.querySelectorAll("[data-catalog-filter-link]"),
  );

  const activateCategory = (category, shouldFocus = false) => {
    const button = filterButtons.find(
      (candidate) => candidate.dataset.productFilter === category,
    );
    if (!button) return;

    button.click();
    if (shouldFocus) button.focus({ preventScroll: true });
  };

  filterLinks.forEach((link) => {
    link.addEventListener("click", (event) => {
      const category = link.dataset.catalogFilterLink;
      if (!category) return;

      event.preventDefault();
      activateCategory(category);
      document
        .querySelector("#honor-products")
        ?.scrollIntoView({ behavior: "smooth", block: "start" });
    });
  });

  filterButtons.forEach((button) => {
    button.addEventListener("click", () => {
      const category = button.dataset.productFilter || "all";
      const url = new URL(window.location.href);
      if (category === "all") {
        url.searchParams.delete("category");
      } else {
        url.searchParams.set("category", category);
      }
      window.history.replaceState({}, "", url);
    });
  });

  const initialCategory =
    new URL(window.location.href).searchParams.get("category") || "all";
  activateCategory(initialCategory);
})();
