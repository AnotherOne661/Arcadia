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
              console.log(event.urlImagen)
                Swal.fire({
                    title: event.nombre_evento,
                    confirmButtonText: "Ok",
                    html: `
                        <p><strong>Fecha:</strong> ${event.fecha_evento}</p>
                        
                        <p><strong>Descripción:</strong> ${event.descripcion}</p>
                        <img src="${event.urlImagen}" alt="Evento" style="width: 100%; margin-top: 10px;"/>
                    ` 
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

async function main() {
    const response = await fetch("/events")
    const events = await response.json()
    renderCalendar(currentMonth, currentYear, events)
    setupEvents(events)
}

main().catch(console.error)