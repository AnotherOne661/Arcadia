const c_year = new Date().getFullYear();

function getYear(){
  const spanYear = document.querySelector([curDate]);
  spanYear.appendChild(c_year);
}
