export function setupAlerts() {
  let alerts = document.querySelectorAll('.alert-hiddable');

  if (alerts.length === 0) {
    return;
  }

  const hideDelay = 3500;
  const baseAnimationDuration = 200;

  setTimeout(() => {
    alerts.forEach((alert) => {
      alert.classList.add('notification__alert_hide');
    });
  }, hideDelay);

  setTimeout(() => {
    alerts.forEach((alert) => {
      alert.remove();
    });
  }, hideDelay + baseAnimationDuration);

}
