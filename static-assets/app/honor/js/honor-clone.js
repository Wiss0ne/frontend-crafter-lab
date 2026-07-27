(() => {
  "use strict";

  const root = document.querySelector(".honor-clone");
  if (!root) return;

  const reducedMotion = window.matchMedia("(prefers-reduced-motion: reduce)");
  const slides = Array.from(root.querySelectorAll("[data-hero-slide]"));
  const dots = Array.from(root.querySelectorAll("[data-hero-dot]"));
  const previousButton = root.querySelector(".honor-hero-arrow--prev");
  const nextButton = root.querySelector(".honor-hero-arrow--next");
  const pauseButton = root.querySelector("[data-hero-pause]");
  const hero = root.querySelector(".honor-hero");

  let autoplayTimer;
  let activeSlide = 0;
  let pointerOverHero = false;
  let focusInsideHero = false;
  let userPaused = false;

  const stopAutoplay = () => {
    window.clearInterval(autoplayTimer);
    autoplayTimer = undefined;
  };

  const showSlide = (index) => {
    if (!slides.length) return;

    activeSlide = (index + slides.length) % slides.length;
    slides.forEach((slide, slideIndex) => {
      const isActive = slideIndex === activeSlide;
      slide.classList.toggle("is-active", isActive);
      slide.setAttribute("aria-hidden", String(!isActive));
      slide.inert = !isActive;
    });
    dots.forEach((dot, dotIndex) => {
      const isActive = dotIndex === activeSlide;
      dot.classList.toggle("is-active", isActive);
      dot.setAttribute("aria-pressed", String(isActive));
    });
  };

  const startAutoplay = () => {
    stopAutoplay();
    if (
      reducedMotion.matches ||
      document.hidden ||
      pointerOverHero ||
      focusInsideHero ||
      userPaused ||
      slides.length < 2
    ) {
      return;
    }

    autoplayTimer = window.setInterval(() => showSlide(activeSlide + 1), 6500);
  };

  const syncPauseButton = () => {
    if (!pauseButton) return;
    pauseButton.setAttribute("aria-pressed", String(userPaused));
    pauseButton.setAttribute(
      "aria-label",
      userPaused ? "繼續自動輪播" : "暫停自動輪播",
    );
  };

  previousButton?.addEventListener("click", () => {
    showSlide(activeSlide - 1);
    startAutoplay();
  });

  nextButton?.addEventListener("click", () => {
    showSlide(activeSlide + 1);
    startAutoplay();
  });

  dots.forEach((dot, dotIndex) => {
    dot.addEventListener("click", () => {
      showSlide(dotIndex);
      startAutoplay();
    });
  });

  pauseButton?.addEventListener("click", () => {
    userPaused = !userPaused;
    syncPauseButton();
    userPaused ? stopAutoplay() : startAutoplay();
  });

  hero?.addEventListener("mouseenter", () => {
    pointerOverHero = true;
    stopAutoplay();
  });

  hero?.addEventListener("mouseleave", () => {
    pointerOverHero = false;
    startAutoplay();
  });

  hero?.addEventListener("focusin", () => {
    focusInsideHero = true;
    stopAutoplay();
  });

  hero?.addEventListener("focusout", () => {
    window.requestAnimationFrame(() => {
      focusInsideHero = Boolean(hero?.contains(document.activeElement));
      startAutoplay();
    });
  });

  document.addEventListener("visibilitychange", () => {
    document.hidden ? stopAutoplay() : startAutoplay();
  });
  reducedMotion.addEventListener("change", startAutoplay);

  showSlide(0);
  syncPauseButton();
  startAutoplay();

  const filters = Array.from(root.querySelectorAll("[data-product-filter]"));
  const products = Array.from(root.querySelectorAll("[data-product-category]"));

  filters.forEach((filter) => {
    filter.addEventListener("click", () => {
      const category = filter.dataset.productFilter;
      filters.forEach((candidate) => {
        const isActive = candidate === filter;
        candidate.classList.toggle("is-active", isActive);
        candidate.setAttribute("aria-pressed", String(isActive));
      });
      products.forEach((product) => {
        const isHidden =
          category !== "all" && product.dataset.productCategory !== category;
        product.classList.toggle("is-hidden", isHidden);
        product.hidden = isHidden;
      });
    });
  });

  const header = document.querySelector(".honor-clone-header");
  const menuButton = document.querySelector(".honor-menu-button");
  const mobileNav = document.querySelector(".honor-mobile-nav");

  const setMenuOpen = (isOpen) => {
    menuButton?.setAttribute("aria-expanded", String(isOpen));
    menuButton?.setAttribute("aria-label", isOpen ? "關閉選單" : "開啟選單");
    mobileNav?.setAttribute("aria-hidden", String(!isOpen));
    mobileNav?.classList.toggle("is-open", isOpen);
    if (mobileNav) mobileNav.inert = !isOpen;
  };

  const closeMenu = () => setMenuOpen(false);
  setMenuOpen(false);

  menuButton?.addEventListener("click", () => {
    setMenuOpen(menuButton.getAttribute("aria-expanded") !== "true");
  });
  mobileNav?.querySelectorAll("a").forEach((link) => {
    link.addEventListener("click", closeMenu);
  });
  document.addEventListener("keydown", (event) => {
    if (
      event.key === "Escape" &&
      menuButton?.getAttribute("aria-expanded") === "true"
    ) {
      closeMenu();
      menuButton.focus();
    }
  });

  const footerToggles = document.querySelectorAll(
    ".honor-clone-footer__links section > button",
  );
  const desktopFooter = window.matchMedia("(min-width: 821px)");

  const setFooterSectionOpen = (button, isOpen) => {
    const content = button.nextElementSibling;
    button.setAttribute("aria-expanded", String(isOpen));
    content?.setAttribute("aria-hidden", String(!isOpen));
    content?.classList.toggle("is-open", isOpen);
    if (content) content.inert = !isOpen;
  };

  const syncFooter = () => {
    const isDesktop = desktopFooter.matches;
    footerToggles.forEach((button) => {
      button.disabled = isDesktop;
      setFooterSectionOpen(button, isDesktop);
    });
  };

  footerToggles.forEach((button) => {
    button.addEventListener("click", () => {
      if (desktopFooter.matches) return;
      setFooterSectionOpen(
        button,
        button.getAttribute("aria-expanded") !== "true",
      );
    });
  });
  desktopFooter.addEventListener("change", syncFooter);
  syncFooter();

  const backToTop = document.querySelector(".honor-back-top");
  const syncScrolledState = () => {
    header?.classList.toggle("is-scrolled", window.scrollY > 12);
    const isVisible = window.scrollY > 700;
    backToTop?.classList.toggle("is-visible", isVisible);
    backToTop?.setAttribute("aria-hidden", String(!isVisible));
    if (backToTop) backToTop.tabIndex = isVisible ? 0 : -1;
  };

  window.addEventListener("scroll", syncScrolledState, { passive: true });
  syncScrolledState();
  backToTop?.addEventListener("click", () => {
    window.scrollTo({
      top: 0,
      behavior: reducedMotion.matches ? "auto" : "smooth",
    });
  });
})();
