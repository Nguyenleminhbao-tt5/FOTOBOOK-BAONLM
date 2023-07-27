import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.openMessager()
  }
  openMessager() {

    function scrollToBottom() {
      const chatBox = document.querySelector(".chat-window");
      chatBox.scrollTo(0, chatBox.scrollHeight);
    }
    
    this.element.addEventListener('click',()=>{
        document.getElementById("myForm").style.display = "block";
    })

    document.querySelector('.cancel').addEventListener('click',()=>{
        document.getElementById("myForm").style.display = "none";
    })

    document.querySelector('.submit-message').addEventListener('click',()=>{
      let message= document.querySelector('.messenger-input');
      scrollToBottom();


      
    })

    



    $('.chat-input input').keyup(function(e) {
      if ($(this).val() == '')
        $(this).removeAttr('good');
      else
        $(this).attr('good', '');
    });
    

  }
}
