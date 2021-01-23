import flatpickr from "flatpickr";

const initFlatpickr = () => {
  const datePicker = document.querySelector('.datepicker');
  if (datePicker) {
    flatpickr(".datepicker", {
      enableTime: true
    });
  }
}

export { initFlatpickr };
