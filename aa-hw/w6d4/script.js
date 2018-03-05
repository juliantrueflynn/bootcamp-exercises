document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    console.log(e);
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!
  const addLi = (e) => {
    e.preventDefault();
    
    const ul = document.getElementById('restaurants');
    const input = document.getElementsByClassName('favorite-input')[0];
    const li = document.createElement('li');
    
    li.textContent = input.value;
    ul.appendChild(li);
    input.value = "";
  };

  let addFavBtn = document.getElementsByClassName('favorite-submit');

  addFavBtn[0].addEventListener('click', addLi);

  // adding new photos

  // --- your code here!
  const imgBtn = document.getElementsByClassName('photo-show-button')[0];
  const imgForm = document.getElementsByClassName('photo-form-container')[0];
  
  imgBtn.addEventListener('click', (e) => {
    imgForm.classList.toggle("hidden");
  });

  imgForm.addEventListener('submit', (e) => {
    e.preventDefault();
    
    const input = document.getElementsByClassName('photo-url-input')[0];
    const ul = document.getElementsByClassName('dog-photos')[0];
    const li = document.createElement('li');
    
    li.innerHTML = `<img src="${input.value}" />`;
    ul.appendChild(li);

    input.value = "";
  });
});
