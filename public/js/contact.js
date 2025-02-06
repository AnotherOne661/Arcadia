
const form = document.querySelector(".contact-form");


function main(){
  const map = L.map("map").setView([40.4308263, -3.6740011], 20);
  let lanLong;

  const popup = L.popup();

  const tiles = L.tileLayer("https://tile.openstreetmap.org/{z}/{x}/{y}.png", {
    maxZoom: 19,
    attribution:
      '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>',
  }).addTo(map);
  L.tileLayer("https://tile.openstreetmap.org/{z}/{x}/{y}.png", {
    maxZoom: 19,
    attribution:
      '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>',
  }).addTo(map);

  const satellite = L.tileLayer(
    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
    {
      attribution:
        '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
    }
  );

  const topography = L.tileLayer(
    "https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png",
    {
      attribution:
        'Map data: &copy; <a href="https://opentopomap.org">OpenTopoMap</a> contributors',
    }
  );

  const esriSatellite = L.tileLayer(
    "https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}",
    {
      attribution:
        "Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community",
    }
  );

  const darkTheme = L.tileLayer(
    "https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}.png",
    {
      attribution:
        '&copy; <a href="https://carto.com/attributions">CartoDB</a> contributors',
    }
  );

  satellite.addTo(map);

  const baseMaps = {
    "Satellite View": satellite,
    Topography: topography,
    "Esri Satellite": esriSatellite,
    "Dark Theme": darkTheme,
  };

  const defaultView = {
    center: [40.4308263, -3.6740011],
    zoom: 10,
  };

  const resetViewButton = L.control({ position: "bottomleft" });

  resetViewButton.onAdd = function () {
    const button = L.DomUtil.create("button", "reset-view-btn");
    button.innerHTML = "Reset View";
    button.style.backgroundColor = "white";
    button.style.border = "2px solid gray";
    button.style.borderRadius = "5px";
    button.style.padding = "5px 10px";
    button.style.cursor = "pointer";
    button.onclick = function () {
      map.setView(defaultView.center, defaultView.zoom);
    };
    return button;
  };

  resetViewButton.addTo(map);

  L.control.layers(baseMaps).addTo(map);

  const markers = [
    { coords: [40.4308263, -3.6740011], name: "Arcadia - Tienda TFG" },
  ];

  markers.forEach((marker) => {
    const leafletMarker = L.marker(marker.coords).addTo(map);
    leafletMarker.bindPopup(marker.name);
  });


  form.addEventListener("submit", (e) => {
    e.preventDefault();
    Swal.fire({
      icon: "success",
      title: "Tu consulta ha sido realizada con éxito",
      
  }).then(() => {
      form.submit();
  });
  });
}
main();