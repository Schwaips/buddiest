
const initTabs = () => {
  const tabs = document.querySelectorAll('.tab-underlined')
  if (tabs) {
    tabs.forEach((tab) => {
      tab.addEventListener('click', (event) => {
        console.log('Hello')
        const activeTabs = document.querySelectorAll('.active')
        activeTabs.forEach((activeTab) => {
          activeTab.classList.remove('active')
        });
      });
    });
  }
}

export { initTabs };
