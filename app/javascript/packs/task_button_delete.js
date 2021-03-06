import toggleModal from './utilities/toggleModal';

const deleteButtons = [...document.querySelectorAll('[data-taskdelete-btn]')]
const closeButtons = [...document.querySelectorAll('.modal-close')]
const cancelButtons = [...document.querySelectorAll('.modal-cancel')]

// opening the modal
for (const button of deleteButtons) {
  button.onclick = () => toggleModal('task', button.dataset.taskdeleteBtn, true)
}

// closing the modal using x button
for (const button of closeButtons) {
  button.onclick = () => toggleModal('task', button.dataset.taskclosemodalId, false)
}

// closing the modal using cancel button
for (const button of cancelButtons) {
  button.onclick = () => toggleModal('task', button.dataset.taskcancelmodalId, false)
}