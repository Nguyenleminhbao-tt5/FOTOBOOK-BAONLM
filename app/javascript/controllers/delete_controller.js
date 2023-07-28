import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.hiddenModal();
  }
  deletePhoto(event)
  {
    function fileListFrom(files) {
      const b = new ClipboardEvent("").clipboardData || new DataTransfer()
      for (const file of files) b.items.add(file)
      return b.files
    }

    const test = document.getElementById('fileInput');
    if (test)
    {
      let files = test.files
      let fileDeleted = event.params['fileName'];
      let listFile = []
      for (let i = 0; i < files.length; i++) {
          if (files[i].name == fileDeleted) continue;
          listFile.push(files[i]);
      }

      const fileList = fileListFrom(listFile)
      test.files = fileList;
      this.element.parentNode.remove()
    }
    
  }
  hiddenModal()
  {
 
    const myModal = this.element;

    // Ẩn modal khi trang được tải lại hoặc rời khỏi trang
    window.addEventListener("beforeunload", function () {
        myModal.classList.remove("show");
        myModal.style.display = "none";
        document.body.classList.remove("modal-open");
        const modalBackdrop = document.querySelector(".modal-backdrop");
        if (modalBackdrop) {
            modalBackdrop.remove();
        }
    });
  }

 
  
}
