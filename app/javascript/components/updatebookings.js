// import { fetchWithToken } from "../utils/fetch_with_token";


// const bookingUpdateValidate = document.querySelector("#update-booking");

// bookingUpdateValidate.addEventListener("click", (event) => {
//   event.preventDefault();

//   fetchWithToken("/bookings/:id", {
//     method: "PATCH",
//     headers: {
//       "Accept": "application/json",
//       "Content-Type": "application/json"
//     },
//     body: JSON.stringify({ booking: { status: "Réservation validée" } })
//   })
//     .then(response => response.json())
//     .then((data) => {
//       // handle JSON response from server
//     });
// });
