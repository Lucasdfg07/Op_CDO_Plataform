function wasBannerRecentlyClosed() {
  const bannerClosedTime = localStorage.getItem('bannerClosedTime');
  if (!bannerClosedTime) {
    return false;
  }

  const timeElapsed = new Date().getTime() - new Date(bannerClosedTime).getTime();
  return timeElapsed < 3 * 24 * 60 * 60 * 1000; // 3 dias em milissegundos
}

function isRunningAsPWA() {
  return (window.matchMedia('(display-mode: standalone)').matches) || (window.navigator.standalone) || document.referrer.includes('android-app://');
}

document.addEventListener('DOMContentLoaded', () => {
  const installBanner = document.getElementById('install_banner');
  const closeBannerButton = document.getElementById('close_banner');

  if (wasBannerRecentlyClosed()) {
    if (installBanner) {
      installBanner.style.display = 'none';
      closeBannerButton.style.display = 'none';
    }
    return;
  }

  let deferredPrompt;
  window.addEventListener('beforeinstallprompt', (e) => {
    if (isRunningAsPWA()) {
      console.log('Is a PWA')
      return;
    }

    e.preventDefault();
    deferredPrompt = e;
    if (installBanner && window.innerWidth <= 500) {
      installBanner.style.display = 'flex';
      closeBannerButton.style.display = 'flex';
    }
  });

  if (closeBannerButton) {
    console.log('PWA Close button is present')
    closeBannerButton.addEventListener('click', (event) => {
      console.log('Closing Banner')
      event.stopPropagation();
      installBanner.style.display = 'none';
      closeBannerButton.style.display = 'none';
      localStorage.setItem('bannerClosedTime', new Date().toISOString());
    });
  }

  if (installBanner) {
    console.log('PWA Banner is Present')
    installBanner.addEventListener('click', () => {
      console.log('Installing PWA')
      if (deferredPrompt) {
        installBanner.style.display = 'none';
        closeBannerButton.style.display = 'none';
        deferredPrompt.prompt();
        deferredPrompt.userChoice.then((choiceResult) => {
          if (choiceResult.outcome === 'accepted') {
            console.log('Usuário aceitou a instalação do PWA');
          } else {
            console.log('Usuário recusou a instalação do PWA');
          }
          deferredPrompt = null;
        });
      }
    });
  }
});
