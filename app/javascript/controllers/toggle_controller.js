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
    toggleProfile(event)
    {

      const element = this.element;
      const value = element.querySelector('.profileTopInfor__list-item__cate').innerHTML;


      const listTabs= document.querySelectorAll('.profileTopInfor__list-item');
      const eleActive =  document.querySelector('.profileTopInfor__list-item.ele-active');
      if (!eleActive)
      {
        listTabs[0].classList.add('ele-active');
      }
      else{
        eleActive.classList.remove('ele-active');
        element.classList.add('ele-active');
        if (listTabs && eleActive)
        {
            eleActive.classList.remove('ele-active');
            switch (value)
            {
                case 'PHOTOS': 
                    listTabs[0].classList.add('ele-active');
                    
                    break;
                case 'ALBUMS':
                    listTabs[1].classList.add('ele-active');
                    
                    break;
                case 'FOLLOWINGS':
                    listTabs[2].classList.add('ele-active');
                   
                    break;
                case 'FOLLOWERS':
                    listTabs[3].classList.add('ele-active');
                    
                    break;
                default:
                    listTabs[0].classList.add('ele-active');
                 
                
            }
            }
      }
     

    }

  
}
