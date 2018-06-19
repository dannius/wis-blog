export function formatTime(iso) {
  const date = new Date(iso);
  const hours = date.getUTCHours();
  const minutes = date.getUTCMinutes();
  const timeString =  `${hours < 10 ? `0${hours}` : hours}:${minutes < 10 ? `0${minutes}` : minutes}`;

  const dd = date.getDate();
  const mm = date.getMonth() + 1;
  const yy = date.getFullYear();

  const dateString = `${dd < 10 ? `0${dd}` : dd}-${mm < 10 ? `0${mm}` : mm}-${yy}`;

  return `${dateString} ${timeString}`;
}