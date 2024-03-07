interface PrivacyPolicyProps {
  appName: string;
  appDescription: string;
}

const PrivacyPolicy = ({ appName, appDescription }: PrivacyPolicyProps) => {
  return (
    <div className="prose prose-light items-start justify-center px-5 md:px-0 py-8">
      <h1>{appName} Privacy Policy</h1>
      <p>Last Updated: 2024-01-17</p>
      <p>
        This privacy policy governs your use of the software application{" "}
        {appName} (“Application”) for mobile devices that was created by an
        individual developer based in Massachusetts, United States. The
        Application is {appDescription}.
      </p>
      <h2>User-Provided Information</h2>
      <p>
        The Application does not require users to provide any personal
        information. No user data is collected, stored, or processed by the
        Application.
      </p>
      <h2>Automatically Collected Information</h2>
      <p>
        In addition, the Application does not collect any information
        automatically from your device.
      </p>
      <h2>
        Does the Application Collect Precise Real-Time Location Information?
      </h2>
      <p>
        The Application does not collect precise information about the location
        of your mobile device.
      </p>
      <h2>
        Do Third Parties See and/or Have Access to Information Obtained by the
        Application?
      </h2>
      <p>
        Since no data is collected, stored, or processed, no information is
        shared with third parties.
      </p>
      <h2>Children&apos;s Privacy</h2>
      <p>
        The Application does not specifically target children under the age of
        13. As the Application does not collect personal information, it is
        compliant with the Children&apos;s Online Privacy Protection Act
        (COPPA).
      </p>
      <h2>Your Consent</h2>
      <p>
        By using the Application, you are consenting to this privacy policy.
      </p>
      <h2>Changes to This Privacy Policy</h2>
      <p>
        This Privacy Policy may be updated from time to time for any reason. You
        are advised to consult this Privacy Policy regularly for any changes, as
        continued use is deemed approval of all changes.
      </p>
      <h2>Contact Us</h2>
      <p>
        If you have any questions regarding privacy while using the Application,
        or have questions about our practices, please contact us via email at
        petervirtue18@gmail.com.
      </p>
    </div>
  );
};

export default PrivacyPolicy;
