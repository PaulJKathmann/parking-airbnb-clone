const startDateField = document.querySelector('#start_date');
const endDateField = document.querySelector('#end_date');
const totalCostField = document.querySelector('#total-cost');
const datepicker = document.querySelector('#date-picker');
const dailyPrice = parseInt(document.querySelector('#daily-price').innerText, 10);

const  calculateTotalCost = (event) => {
  const oneDay = 86400000
  const endDate = new Date(endDateField.value);
  const startDate = new Date(startDateField.value);
  const days = (endDate - startDate)/oneDay;
  if (365 > days || days > 0) {
    totalCostField.innerHTML = days * dailyPrice;
  };
};

startDateField.addEventListener('input', calculateTotalCost)
endDateField.addEventListener('input', calculateTotalCost)
