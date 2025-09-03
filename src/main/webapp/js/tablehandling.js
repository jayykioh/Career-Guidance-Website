document.addEventListener('DOMContentLoaded', () => {
    const rows = document.querySelectorAll('tbody tr');
    const codeField = document.getElementById('detailCode');
    const nameField = document.getElementById('detailName');
    const locationField = document.getElementById('detailLocation');
    const regionField = document.getElementById('detailRegion');
    const majorLink = document.getElementById('majorLink');
    const websiteLink = document.getElementById('websiteLink');
    const imageTag = document.getElementById('universityImage');
    const contextPath = document.body.getAttribute("data-context") || "";




    function setDetail(row) {
        const code = row.dataset.code;
        const name = row.dataset.name;
        const location = row.dataset.location;
        const region = row.dataset.region;
        const website = row.dataset.website;

        codeField.textContent = code;
        nameField.textContent = name;
        locationField.textContent = location;
        regionField.textContent = region;

       const majorUrl = `${contextPath}/UniversityController?code=${encodeURIComponent(code)}&name=${encodeURIComponent(name)}&region=${encodeURIComponent(region)}&location=${encodeURIComponent(location)}&website=${encodeURIComponent(website)}`;


        majorLink.href = majorUrl;



        if (websiteLink && website) {
            websiteLink.href = website;
            websiteLink.style.opacity = '1';
            websiteLink.style.pointerEvents = 'auto';
        } else {
            websiteLink.style.opacity = '0.5';
            websiteLink.style.pointerEvents = 'none';
        }

        if (imageTag && code) {
            imageTag.src = `${contextPath}/images/universities/${code}.jpg`;
            imageTag.onerror = () => {
                imageTag.src = `${contextPath}/images/universities/default.jpg`;
            };
        }
    }

    rows.forEach(row => {
        row.addEventListener('click', () => {
            setDetail(row);
        });
    });

    if (rows.length > 0) {
        setDetail(rows[0]);
    }
});