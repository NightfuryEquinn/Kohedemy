const modal = document.getElementsByClassName("modal")[0]
const trigger = document.getElementsByClassName("card-button")
const closeBtn = document.getElementsByClassName("modal-icon")[0]

for (let i = 0; i < trigger.length; i++) {
  trigger[i].addEventListener("click", () => {
    modal.style.opacity = 1
    modal.style.pointerEvents = "all"
  })
}

modal.addEventListener("click", () => {
  modal.style.opacity = 0
  modal.style.pointerEvents = "none"
})

closeBtn.addEventListener("click", () => {
  modal.style.opacity = 0
  modal.style.pointerEvents = "none"
})