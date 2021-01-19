import { fetchWithToken } from "../utils/fetch_with_token";


const bookingUpdateValidate = document.querySelector("#update-booking");

bookingUpdateValidate.addEventListener("onclick", (event) => {
  event.preventDefault();

  fetchWithToken("/offers/:offer_id/bookings/:id", {
    method: "PATCH",
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/json"
    },
    body: JSON.stringify({ booking: { status: "Réservation validée" } })
  })
    .then(response => response.json())
    .then((data) => {
      // handle JSON response from server
    });
});
