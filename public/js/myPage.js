function main() {
  document.querySelector(".edit").addEventListener("click", () => {
    document.querySelector(".edit").style.display = "none";
    document.querySelector(".edit-form").classList.remove("hidden");
    document.querySelector(".edit-form").style.display = "flex";
  });
}
main();
