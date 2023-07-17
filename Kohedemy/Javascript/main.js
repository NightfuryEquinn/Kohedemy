const modal = document.getElementsByClassName("modal")[0]
const modalWrap = document.getElementsByClassName("modal-wrap")[0]
const editModalWrap = document.getElementsByClassName("edit-modal-wrap")[0]
const closeBtn = document.getElementsByClassName("modal-icon")[0]

/** 
 * For Course Selection, including Admin
 **/
const cardTrigger = document.getElementsByClassName("cards")
const trigger = document.getElementsByClassName("card-button")

const handleButtonClick = (courseID) => {
  var newURL = window.location.protocol + "//" + window.location.host + window.location.pathname + '?CourseId=' + courseID;
  window.history.pushState({ path: newURL }, '', newURL);
}

const changeModalContent = (i) => {
  const triggerCourseTitle = cardTrigger[i].getElementsByTagName("h4")[0]
  const triggerCourseDescription = cardTrigger[i].getAttribute("data-description")
  const triggerCourseDifficulty = cardTrigger[i].getAttribute("data-difficulty")
  const triggerCourseImage = cardTrigger[i].getElementsByClassName("card-image")[0].getAttribute('src')

  const modalTitle = modalWrap.getElementsByClassName("modal-title")[0]
  const modalDescription = modalWrap.getElementsByClassName("modal-description")[0]
  const modalDifficulty = modalWrap.getElementsByClassName("modal-difficulty")[0]
  const modalImage = modalWrap.getElementsByClassName("modal-image")[0]

  modalTitle.textContent = triggerCourseTitle.innerText
  modalDescription.textContent = triggerCourseDescription
  modalDifficulty.textContent = triggerCourseDifficulty
  modalImage.setAttribute('src', triggerCourseImage)

  const triggerCourseId = cardTrigger[i].getAttribute("data-id")
  modalWrap.setAttribute("data-id", triggerCourseId)

  handleButtonClick(triggerCourseId)
}

if (trigger && closeBtn) {
  for (let i = 0; i < trigger.length; i++) {
    trigger[i].addEventListener("click", () => {
      modal.style.opacity = 1
      modal.style.pointerEvents = "all"

      changeModalContent(i)
    })
  }

  modal.addEventListener("click", () => {
    modal.style.opacity = 0
    modal.style.pointerEvents = "none"
  })

  modalWrap.addEventListener("click", (e) => {
    e.stopPropagation();
  })

  closeBtn.addEventListener("click", () => {
    modal.style.opacity = 0
    modal.style.pointerEvents = "none"
  })
}

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