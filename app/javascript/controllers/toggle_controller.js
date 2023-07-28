import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.toggleFeed()
    this.toggleLeftSidebar()
    this.toggleLeftSidebarAdmin()

  }
  toggleLeftSidebar()
  {
    const value = this.element.dataset.leftSidebar
    const eleActive = document.querySelector('.sidebarLeftListItem__link.active')
    if (value == 'discover' && eleActive)
    {
      eleActive.classList.remove('active')
      document.querySelectorAll('.sidebarLeftListItem__link')[1].classList.add('active')
    }
    else if (value == 'feed'){
      eleActive.classList.remove('active')
      document.querySelectorAll('.sidebarLeftListItem__link')[0].classList.add('active')
    }
  }
  toggleFeed()
  {
    const value = this.element.dataset.photoChecked;
    if (value=="album")
    {
       document.getElementById('btnradio1').checked= false;
       document.getElementById('btnradio2').checked= true;
    }
  }
  toggleLeftSidebarAdmin()
  {
    const value = this.element.dataset.leftSidebarAdmin
    const elementActive = document.querySelector('.sidebarLeftListItem__link.active')
    if (value == 'admin/photos' && elementActive)
    {
      elementActive.classList.remove('active')
      document.querySelectorAll('.sidebarLeftListItem__link')[0].classList.add('active')
    }
    else if (value == 'admin/albums' && elementActive)
    {
      elementActive.classList.remove('active')
      document.querySelectorAll('.sidebarLeftListItem__link')[1].classList.add('active')
    }
    else if (value == 'admin/users' && elementActive)
    {
      elementActive.classList.remove('active')
      document.querySelectorAll('.sidebarLeftListItem__link')[2].classList.add('active')
    }


  }
  
}
