const calendarDates = document.querySelector(".calendar-dates")
const monthYear = document.getElementById("month-year")
const prevMonthBtn = document.getElementById("prev-month")
const nextMonthBtn = document.getElementById("next-month")

let currentDate = new Date()
let currentMonth = currentDate.getMonth()
let currentYear = currentDate.getFullYear()

const months = [
    "Enero",
    "Febrero",
    "Marzo",
    "Abril",
    "Mayo",
    "Junio",
    "Julio",
    "Agosto",
    "Septiembre",
    "Octubre",
    "Noviembre",
    "Diciembre",
]

function renderCalendar(month, year, events) {
    calendarDates.innerHTML = ""
    monthYear.textContent = `${months[month]} ${year}`

    // Get the first day of the month
    const firstDay = new Date(year, month, 1).getDay()

    // Get the number of days in the month
    const daysInMonth = new Date(year, month + 1, 0).getDate()

    // Create blanks for days of the week before the first day
    for (let i = 0; i < firstDay; i++) {
        const blank = document.createElement("div")
        calendarDates.appendChild(blank)
    }

    // Populate the days
    for (let i = 1; i <= daysInMonth; i++) {
        const day = document.createElement("div")
        day.textContent = i

        const event = events.find((event) => {
            const eventDate = new Date(event.fecha_evento)
            return eventDate.getDate() === i && eventDate.getMonth() === month && eventDate.getFullYear() === year
        })

        if (event) {
            day.classList.add("event")
            day.addEventListener("click", () => {
                Swal.fire({
                    title: `<span class="popup-title">${event.nombre_evento}</span>`, 
                    confirmButtonText: "Ok",
                    html: `
                        <p class="popup-title"><strong>Fecha:</strong> ${event.fecha_evento}</p>
                        
                        <p class="popup-title"><strong>Descripción:</strong> ${event.descripcion}</p>
                        <img src="${event.urlImagen}" alt="Evento" style="width: 100%; margin-top: 10px;"/>
                    ` ,
                    confirmButtonColor: "#eec643",
                    confirmTextColor: "#141414",

                })
            })
        }

        calendarDates.appendChild(day)
    }
}

function setupEvents(events) {
    prevMonthBtn.addEventListener("click", () => {
        currentMonth--
        if (currentMonth < 0) {
            currentMonth = 11
            currentYear--
        }
        renderCalendar(currentMonth, currentYear, events)
    })

    nextMonthBtn.addEventListener("click", () => {
        currentMonth++
        if (currentMonth > 11) {
            currentMonth = 0
            currentYear++
        }
        renderCalendar(currentMonth, currentYear, events)
    })
}

function renderMobileEvents(events) {
    const mobileEventsContainer = document.querySelector(".mobile-calendar");
    const eventsDiv = mobileEventsContainer.querySelector(".events");
    eventsDiv.innerHTML = ""
    events.forEach((event) => {
        const eventItem = document.createElement("div")
        eventItem.classList.add("mobile-event")
        eventItem.innerHTML = `
            <img src="${event.urlImagen}" alt="Evento" style="width: 100%;"/>
            <div class="mobile-event-content">
                <h3 class="event-title">${event.nombre_evento}</h3>
                <p class="event-description">${event.descripcion}</p>
                <span class="event-date">${event.fecha_evento}</span>
                <button class="buyButton-a">Ver más</button>
                `
        eventItem.querySelector(".buyButton-a").addEventListener("click", () => {
            Swal.fire({
                title: `<span class="popup-title">${event.nombre_evento}</span>`, 
                confirmButtonText: "Ok",
                html: `
                    <p class="popup-title"><strong>Fecha:</strong> ${event.fecha_evento}</p>
                    
                    <p class="popup-title"><strong>Descripción:</strong> ${event.descripcion}</p>
                    <img src="${event.urlImagen}" alt="Evento" style="width: 100%; margin-top: 10px;"/>
                ` ,
                confirmButtonColor: "#eec643",
                confirmTextColor: "#141414",
            })
        })
                mobileEventsContainer.appendChild(eventItem)
    });

    console.log(eventsDiv)
    console.log(eventItem)
}

async function main() {
    const response = await fetch("/events")
    const events = await response.json()
    renderCalendar(currentMonth, currentYear, events)
    setupEvents(events)
    renderMobileEvents(events);
}

main().catch(console.error)