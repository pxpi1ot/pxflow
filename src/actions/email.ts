"use server";
import nodemailer from 'nodemailer';

const transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: process.env.EMAIL_FROM,
    pass: process.env.GMAIL_PASS  // 需使用Gmail的「应用专用密码」
  }
});
export async function sendEmail({
  to,
  subject,
  text,
}: {
  to: string;
  subject: string;
  text: string;
}) {

  if (!process.env.RESEND_API_KEY) {
    throw new Error("RESEND_API_KEY_API_KEY environment variable is not set");
  }
  if (!process.env.EMAIL_FROM) {
    throw new Error("EMAIL_FROM environment variable is not set");
  }



  try {


    const mailOptions = {
      from: '"app.pxpilot" <your-email@example.com>',
      to,
      subject,
      text,

    };
    const data = await transporter.sendMail(mailOptions);

    return Response.json(data);

  } catch (error) {
    console.error("Error sending email:", error);
    return Response.json({ error }, { status: 500 });
  }
}
