import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'price' ];

  updatePrice = (event) => {
    const offerPrice = document.getElementById('offer-price').innerText.match(/\d+/)[0];

    let dateBegin = '';
    let dateEnd = '';

    // Je récupère mes dates
    // Si je change dateBegin ->
    if (event.srcElement.id === 'booking_date_begin') {
      dateBegin = event.srcElement.value;
      dateEnd = document.getElementById('booking_date_end').value;
    //Si je change dateEnd ->
    } else {
      dateBegin = document.getElementById('booking_date_begin').value;
      dateEnd = event.srcElement.value;
    }

    console.log({dateBegin})
    console.log({dateEnd})

    // si date begin ou date end est vide, je fais rien, sinon ->
    if (dateBegin !== '' && dateEnd !== '') {
      const numberOfHours = Math.abs((new Date(dateEnd) - new Date(dateBegin))) / 3600000
      const totalPrice =  numberOfHours * offerPrice
      this.priceTarget.innerText = `Prix total pour ${numberOfHours} heures: ${totalPrice} €`;
    }
  }
}

