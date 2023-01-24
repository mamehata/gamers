document.addEventListener('turbolinks:load', function() {
  let raty_elem = document.querySelector("#game_review");
  raty_elem.innerHTML = "";
  let raty_opt = {
    size: 30,
    starOff: "/assets/star-off.png",
    starOn: "/assets/star-on.png",
    starHalf: "/assets/star-half.png",
    half: true,
    hints: [
      ['1/2 bad', 'bad'],
      ['1/2 poor', 'poor'],
      ['1/2 regular', 'regular'],
      ['1/2 good', 'good'],
      ['1/2 gorgeous', 'gorgeous'],
    ],
    scoreName: 'game_review[game_rating]',
  };
  raty(raty_elem,raty_opt);
});