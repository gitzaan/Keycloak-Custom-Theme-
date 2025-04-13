(function() {
    console.log("Siemens theme script starting");
  
    // Create and inject Siemens logo text
    function addSiemensLogo() {
      const headerBrand = document.querySelector('.pf-v5-c-page__header-brand');
      if (!headerBrand || document.getElementById('siemens-brand-text')) return;
  
      // First remove any existing logo if present
      const existingLogos = headerBrand.querySelectorAll('.pf-v5-c-brand, img');
      existingLogos.forEach(logo => logo.style.display = 'none');
      
      // Create and add Siemens text
      const logoText = document.createElement('div');
      logoText.id = 'siemens-brand-text';
      logoText.textContent = 'SIEMENS';
      logoText.style.color = 'white';
      logoText.style.fontWeight = 'bold';
      logoText.style.fontSize = '18px';
      logoText.style.letterSpacing = '1px';
      logoText.style.marginRight = '20px';
      headerBrand.insertBefore(logoText, headerBrand.firstChild);
      console.log('Siemens logo text added');
    }
  
    // Direct style application (as backup)
    function applyStyles() {
      // Header
      const header = document.querySelector('.pf-v5-c-page__header');
      if (header) {
        header.style.backgroundColor = '#0c0c24';
        header.style.borderBottom = '4px solid #17d4d4';
      }
  
      // Sidebar
      const sidebar = document.querySelector('.pf-v5-c-page__sidebar');
      if (sidebar) {
        sidebar.style.backgroundColor = '#0c0c24';
      }
  
      // Navigation links
      document.querySelectorAll('.pf-v5-c-nav__link').forEach(link => {
        link.style.color = 'white';
      });
  
      // Primary buttons
      document.querySelectorAll('.pf-v5-c-button.pf-m-primary').forEach(button => {
        button.style.backgroundColor = '#17d4d4';
        button.style.color = 'black';
        button.style.borderColor = '#17d4d4';
      });
    }
  
    // Function to add a custom footer
    function addFooter() {
      if (document.getElementById('siemens-footer')) return;
      
      const main = document.querySelector('.pf-v5-c-page__main');
      if (!main) return;
      
      const footer = document.createElement('div');
      footer.id = 'siemens-footer';
      footer.textContent = '© Siemens AG';
      footer.style.textAlign = 'center';
      footer.style.marginTop = '40px';
      footer.style.padding = '20px 0';
      footer.style.color = '#666';
      
      main.appendChild(footer);
    }
  
    // Execute when DOM is ready
    function initializeTheme() {
      addSiemensLogo();
      applyStyles();
      addFooter();
      console.log("Siemens theme applied");
    }
  
    // Run on DOMContentLoaded
    if (document.readyState === 'loading') {
      document.addEventListener('DOMContentLoaded', initializeTheme);
    } else {
      initializeTheme();
    }
  
    // Also run after load
    window.addEventListener('load', initializeTheme);
  
    // Use MutationObserver to detect React updates
    const observer = new MutationObserver(() => {
      addSiemensLogo();
      applyStyles();
      addFooter();
    });
  
    // Start observing when DOM is ready
    if (document.body) {
      observer.observe(document.body, { childList: true, subtree: true });
    } else {
      window.addEventListener('load', () => {
        observer.observe(document.body, { childList: true, subtree: true });
      });
    }
    
    // Also periodically check to ensure styles stay applied
    setInterval(initializeTheme, 2000);
  })();