const modal = document.getElementsByClassName("modal")[0]
const modalWrap = document.getElementsByClassName("modal-wrap")[0]
const editModalWrap = document.getElementsByClassName("edit-modal-wrap")[0]
const closeBtn = document.getElementsByClassName("modal-icon")[0]

/**
 * For Editing User Profile
 */
const editTrigger = document.getElementById("edit-button")
const cancelButton = document.getElementById("cancel-button")

if (editTrigger) {
  editTrigger.addEventListener("click", () => {
    modal.style.opacity = 1
    modal.style.pointerEvents = "all"
  })

  modal.addEventListener("click", () => {
    modal.style.opacity = 0
    modal.style.pointerEvents = "none"
  })

  editModalWrap.addEventListener("click", (e) => {
    e.stopPropagation();
  })

  cancelButton.addEventListener("click", () => {
    modal.style.opacity = 0
    modal.style.pointerEvents = "none"
  })
}