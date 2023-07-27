import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.toast()
  }
  toast()
  {
    var toastElement = this.element
    var toast = new bootstrap.Toast(toastElement);
    toast.show();
    
    var closeBtn =document.querySelector('.btn-close')
    closeBtn.addEventListener('click', ()=>{
      toast.hide();
    })
    // Hide the toast after 3 seconds
    setTimeout(function() {
      toast.hide();
    }, 3000);
  }
}
