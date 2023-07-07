﻿const modal = document.getElementsByClassName("modal")[0]
const modalWrap = document.getElementsByClassName("modal-wrap")[0]
const editModalWrap = document.getElementsByClassName("edit-modal-wrap")[0]
const closeBtn = document.getElementsByClassName("modal-icon")[0]

/** 
 * For Course Selection, including Admin 
 **/
const trigger = document.getElementsByClassName("card-button")

if (trigger && closeBtn) {
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

  modalWrap.addEventListener("click", (e) => {
    e.preventDefault();
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
    e.preventDefault();
    e.stopPropagation();
  })
}